import XCTest
@testable import DecisionTrainerCore

final class DecisionTrainerCoreTests: XCTestCase {

    // The built-in dataset must be deterministic (fixed seed -> identical samples).
    func testDatasetIsDeterministic() {
        let a = DatasetFactory.makeFruitRecommendation()
        let b = DatasetFactory.makeFruitRecommendation()
        XCTAssertEqual(a.samples, b.samples)
        XCTAssertEqual(a.samples.count, 220)
    }

    // The trained tree must classify every sample and reach a reasonable accuracy.
    func testTrainAndPredict() {
        let dataset = DatasetFactory.makeFruitRecommendation()
        let result = TreeTrainer.train(dataset: dataset, criterion: .entropy, maxDepth: 5, minSamplesLeaf: 4)

        XCTAssertFalse(result.steps.isEmpty)
        XCTAssertFalse(result.tree.isLeaf, "The root should be split.")

        var correct = 0
        for sample in dataset.samples {
            let p = TreeTrainer.predict(
                tree: result.tree,
                sample: sample,
                featureNames: dataset.featureNames,
                classNames: dataset.classNames
            )
            XCTAssertFalse(p.path.isEmpty, "Every sample should have a decision path.")
            if p.label == sample.label { correct += 1 }
        }
        let accuracy = Double(correct) / Double(dataset.samples.count)
        XCTAssertGreaterThan(accuracy, 0.85, "The tree should learn the pattern on the training set.")
    }

    // Information gain must be non-negative and the chosen split must be the max-gain one.
    func testBestSplitIsMaxGain() {
        let dataset = DatasetFactory.makeFruitRecommendation()
        let result = TreeTrainer.train(dataset: dataset, criterion: .gini, maxDepth: 1, minSamplesLeaf: 4)
        let root = result.steps[0]
        XCTAssertFalse(root.isLeaf)

        for c in root.candidates {
            XCTAssertGreaterThanOrEqual(c.infoGain, 0)
        }
        if let best = root.candidates.first, let chosen = root.chosen {
            XCTAssertEqual(best.infoGain, chosen.infoGain, accuracy: 1e-12)
        }
    }

    // Both impurity measures peak at a 50/50 mix.
    func testImpurityPeaksAtHalf() {
        let entropy = Criterion.entropy.impurity(classCounts: [1, 1], total: 2)
        let gini = Criterion.gini.impurity(classCounts: [1, 1], total: 2)
        XCTAssertEqual(entropy, 1.0, accuracy: 1e-9)
        XCTAssertEqual(gini, 0.5, accuracy: 1e-9)

        let pure = Criterion.entropy.impurity(classCounts: [4, 0], total: 4)
        XCTAssertEqual(pure, 0.0, accuracy: 1e-9)
    }

    // Evaluation should report sensible accuracies and a consistent confusion matrix.
    func testEvaluation() {
        let dataset = DatasetFactory.makeFruitRecommendation()
        let e = TreeTrainer.evaluate(dataset: dataset, criterion: .entropy, maxDepth: 4, minSamplesLeaf: 4)
        XCTAssertGreaterThan(e.trainAccuracy, 0.75)
        XCTAssertGreaterThan(e.testAccuracy, 0.68)
        XCTAssertEqual(e.testConfusion.flatMap { $0 }.reduce(0, +), e.testCount)
    }

    // Limiting max depth must keep the tree at or above that depth bound.
    func testMaxDepthIsRespected() {
        let dataset = DatasetFactory.makeFruitRecommendation()
        let result = TreeTrainer.train(dataset: dataset, criterion: .entropy, maxDepth: 2, minSamplesLeaf: 2)
        let maxDepth = result.steps.map(\.depth).max() ?? 0
        XCTAssertLessThanOrEqual(maxDepth, 2)
    }

    // MARK: CSV import

    func testCSVImportWithHeader() throws {
        let csv = """
        x,y,label
        1.0,2.0,A
        3.0,4.0,B
        5.0,6.0,A
        7.0,8.0,B
        """
        let dataset = try DatasetLoader.parse(text: csv, name: "Test")
        XCTAssertEqual(dataset.samples.count, 4)
        // Labels A/B sort alphabetically -> A=0, B=1.
        XCTAssertEqual(dataset.classNames, ["A", "B"])
        XCTAssertEqual(dataset.samples[0].label, 0)
        XCTAssertEqual(dataset.samples[1].label, 1)
        XCTAssertEqual(dataset.samples[0].x, 1.0)
        XCTAssertEqual(dataset.samples[0].y, 2.0)
    }

    func testCSVImportWithoutHeaderAndNumericLabels() throws {
        let csv = """
        1,2,0
        3,4,1
        5,6,0
        """
        let dataset = try DatasetLoader.parse(text: csv)
        XCTAssertEqual(dataset.samples.count, 3)
        XCTAssertEqual(dataset.classNames, ["0", "1"])
        XCTAssertEqual(dataset.samples[1].label, 1)
    }

    func testCSVImportRejectsNonNumericFeature() {
        let csv = """
        1,hello,0
        3,4,1
        """
        XCTAssertThrowsError(try DatasetLoader.parse(text: csv)) { error in
            XCTAssertTrue(error is DatasetImportError)
        }
    }

    func testCSVImportRejectsMoreThanTwoClasses() {
        let csv = """
        1,2,A
        3,4,B
        5,6,C
        """
        XCTAssertThrowsError(try DatasetLoader.parse(text: csv)) { error in
            guard case DatasetImportError.needsExactlyTwoClasses = error else {
                return XCTFail("Expected needsExactlyTwoClasses, got \(error)")
            }
        }
    }

    func testCSVImportRejectsBadColumnCount() {
        let csv = """
        1,2
        3,4
        """
        XCTAssertThrowsError(try DatasetLoader.parse(text: csv)) { error in
            guard case DatasetImportError.badColumnCount = error else {
                return XCTFail("Expected badColumnCount, got \(error)")
            }
        }
    }

    func testImportedDatasetCanBeTrained() throws {
        let csv = """
        x,y,label
        0,0,0
        0,1,0
        1,0,0
        1,1,1
        50,50,1
        51,50,1
        50,51,1
        51,51,1
        """
        let dataset = try DatasetLoader.parse(text: csv)
        let result = TreeTrainer.train(dataset: dataset, criterion: .entropy, maxDepth: 4, minSamplesLeaf: 1)
        XCTAssertFalse(result.steps.isEmpty)
        let p = TreeTrainer.predict(tree: result.tree, sample: Sample(id: 0, features: [51, 51], label: 1), featureNames: dataset.featureNames, classNames: dataset.classNames)
        XCTAssertEqual(p.label, 1)
    }
}
