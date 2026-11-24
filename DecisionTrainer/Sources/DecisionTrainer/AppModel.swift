import Foundation
import Observation
#if canImport(DecisionTrainerCore)
import DecisionTrainerCore
#endif

// MARK: - Sidebar sections

enum AppSection: String, CaseIterable, Identifiable {
    case intro, dataset, impurity, gain, train, predict, evaluate

    var id: String { rawValue }

    var title: String {
        switch self {
        case .intro: return "What Is a Decision Model"
        case .dataset: return "The Dataset"
        case .impurity: return "Purity & Impurity"
        case .gain: return "Information Gain & Splits"
        case .train: return "Step-by-Step Training"
        case .predict: return "Making Predictions"
        case .evaluate: return "Evaluating the Model"
        }
    }

    var subtitle: String {
        switch self {
        case .intro: return "Overview of the concept"
        case .dataset: return "Features, labels, samples"
        case .impurity: return "Entropy and Gini impurity"
        case .gain: return "How the best split is chosen"
        case .train: return "Train a tree yourself, step by step"
        case .predict: return "Walk a new sample down the tree"
        case .evaluate: return "Accuracy and confusion matrix"
        }
    }

    var icon: String {
        switch self {
        case .intro: return "sparkles"
        case .dataset: return "tablecells"
        case .impurity: return "chart.pie"
        case .gain: return "scissors"
        case .train: return "hammer"
        case .predict: return "questionmark.circle"
        case .evaluate: return "checkmark.seal"
        }
    }
}

// MARK: - App state

@Observable
final class AppModel {
    var dataset: Dataset

    var criterion: Criterion = .entropy
    var maxDepth: Int = 4
    var minSamplesLeaf: Int = 4

    var result: TrainingResult
    var currentStep: Int = 0

    var predictX: Double = 5.0
    var predictY: Double = 5.0

    var evalResult: EvalResult?
    var importError: String?

    init() {
        let builtIn = DatasetFactory.makeFruitRecommendation()
        dataset = builtIn
        result = TreeTrainer.train(
            dataset: builtIn,
            criterion: Criterion.entropy,
            maxDepth: 4,
            minSamplesLeaf: 4
        )
    }

    var totalSteps: Int { result.steps.count }
    var step: TrainingStep { result.steps[min(currentStep, result.steps.count - 1)] }

    var isUsingBuiltInDataset: Bool {
        dataset.name == DatasetFactory.makeFruitRecommendation().name
    }

    var prediction: Prediction {
        let sample = Sample(id: -1, features: [predictX, predictY], label: 0)
        return TreeTrainer.predict(
            tree: result.tree,
            sample: sample,
            featureNames: dataset.featureNames,
            classNames: dataset.classNames
        )
    }

    func retrain() {
        result = TreeTrainer.train(dataset: dataset, criterion: criterion, maxDepth: maxDepth, minSamplesLeaf: minSamplesLeaf)
        currentStep = min(currentStep, result.steps.count - 1)
        evalResult = nil
    }

    /// Replaces the active dataset, resets the prediction point to its centre,
    /// and retrains from scratch.
    func setDataset(_ newDataset: Dataset) {
        dataset = newDataset
        predictX = (newDataset.xRange.lowerBound + newDataset.xRange.upperBound) / 2
        predictY = (newDataset.yRange.lowerBound + newDataset.yRange.upperBound) / 2
        currentStep = 0
        evalResult = nil
        importError = nil
        retrain()
    }

    /// Imports a CSV file and switches to it on success.
    func importCSV(from url: URL) {
        let didAccess = url.startAccessingSecurityScopedResource()
        defer { if didAccess { url.stopAccessingSecurityScopedResource() } }
        do {
            let imported = try DatasetLoader.load(from: url)
            setDataset(imported)
        } catch {
            importError = error.localizedDescription
        }
    }

    func useBuiltInDataset() {
        setDataset(DatasetFactory.makeFruitRecommendation())
    }

    func nextStep() { if currentStep < result.steps.count - 1 { currentStep += 1 } }
    func prevStep() { if currentStep > 0 { currentStep -= 1 } }
    func finish() { currentStep = result.steps.count - 1 }
    func resetToStart() { currentStep = 0 }

    func runEvaluation() {
        evalResult = TreeTrainer.evaluate(dataset: dataset, criterion: criterion, maxDepth: maxDepth, minSamplesLeaf: minSamplesLeaf)
    }
}

// MARK: - Partial tree (grows step by step)

/// A mutable node representing "the tree as trained so far". Nodes that have not
/// been processed yet are marked as frontier placeholders.
final class PartialNode {
    let id: String
    var isLeaf = false
    var isFrontier = true
    var splitFeature: Int?
    var splitThreshold: Double?
    var prediction: Int?
    var probabilities: [Double]?
    var impurity: Double = 0
    var sampleCount: Int = 0
    var left: PartialNode?
    var right: PartialNode?

    init(id: String) { self.id = id }
}

enum StepTree {
    /// Rebuilds the part of the tree defined by the first `index + 1` steps.
    static func partialTree(steps: [TrainingStep], upTo index: Int) -> PartialNode {
        let root = PartialNode(id: "0")
        var map: [String: PartialNode] = ["0": root]

        for step in steps.prefix(index + 1) {
            let node = map[step.nodeID] ?? PartialNode(id: step.nodeID)
            map[step.nodeID] = node
            node.isFrontier = false
            node.impurity = step.impurityBefore
            node.sampleCount = step.sampleCount
            node.isLeaf = step.isLeaf
            node.prediction = step.prediction
            node.probabilities = step.probabilities

            if !step.isLeaf, let chosen = step.chosen {
                node.splitFeature = chosen.feature
                node.splitThreshold = chosen.threshold
                let leftID = step.nodeID + "L"
                let rightID = step.nodeID + "R"
                let leftNode = PartialNode(id: leftID)
                let rightNode = PartialNode(id: rightID)
                node.left = leftNode
                node.right = rightNode
                map[leftID] = leftNode
                map[rightID] = rightNode
            }
        }
        return root
    }

    /// Turns a node id such as "0LR" into a readable path such as "root · yes · no".
    static func friendlyName(_ id: String) -> String {
        if id == "0" { return "root" }
        var result = "root"
        for ch in id.dropFirst() {
            result += (ch == "L") ? " · yes" : " · no"
        }
        return result
    }
}
