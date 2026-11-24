import Foundation

// MARK: - Tree nodes and training results

public final class TreeNode: Sendable {
    public let nodeID: String
    public let isLeaf: Bool
    public let prediction: Int?
    public let probabilities: [Double]?
    public let splitFeature: Int?
    public let splitThreshold: Double?
    public let left: TreeNode?
    public let right: TreeNode?
    public let impurity: Double
    public let sampleCount: Int
    public let depth: Int
    public let region: Region

    public init(
        nodeID: String,
        isLeaf: Bool,
        prediction: Int?,
        probabilities: [Double]?,
        splitFeature: Int?,
        splitThreshold: Double?,
        left: TreeNode?,
        right: TreeNode?,
        impurity: Double,
        sampleCount: Int,
        depth: Int,
        region: Region
    ) {
        self.nodeID = nodeID
        self.isLeaf = isLeaf
        self.prediction = prediction
        self.probabilities = probabilities
        self.splitFeature = splitFeature
        self.splitThreshold = splitThreshold
        self.left = left
        self.right = right
        self.impurity = impurity
        self.sampleCount = sampleCount
        self.depth = depth
        self.region = region
    }
}

/// A candidate split: cut the samples in two at one feature/threshold pair.
public struct CandidateSplit: Identifiable, Sendable {
    public let id: Int
    public let feature: Int
    public let threshold: Double
    public let infoGain: Double
    public let leftCount: Int
    public let rightCount: Int
    public let leftImpurity: Double
    public let rightImpurity: Double

    public init(
        id: Int,
        feature: Int,
        threshold: Double,
        infoGain: Double,
        leftCount: Int,
        rightCount: Int,
        leftImpurity: Double,
        rightImpurity: Double
    ) {
        self.id = id
        self.feature = feature
        self.threshold = threshold
        self.infoGain = infoGain
        self.leftCount = leftCount
        self.rightCount = rightCount
        self.leftImpurity = leftImpurity
        self.rightImpurity = rightImpurity
    }
}

/// One step of training: process a single node (split it, or declare it a leaf).
/// Steps are ordered breadth-first (level by level), which is exactly what the
/// UI uses to grow the tree one layer at a time.
public struct TrainingStep: Identifiable, Sendable {
    public let id: Int
    public let nodeID: String
    public let depth: Int
    public let sampleCount: Int
    public let classCounts: [Int]
    public let impurityBefore: Double
    public let region: Region
    public let candidates: [CandidateSplit]
    public let chosen: CandidateSplit?
    public let impurityAfter: Double?
    public let isLeaf: Bool
    public let leafReason: String?
    public let prediction: Int?
    public let probabilities: [Double]?

    public init(
        id: Int,
        nodeID: String,
        depth: Int,
        sampleCount: Int,
        classCounts: [Int],
        impurityBefore: Double,
        region: Region,
        candidates: [CandidateSplit],
        chosen: CandidateSplit?,
        impurityAfter: Double?,
        isLeaf: Bool,
        leafReason: String?,
        prediction: Int?,
        probabilities: [Double]?
    ) {
        self.id = id
        self.nodeID = nodeID
        self.depth = depth
        self.sampleCount = sampleCount
        self.classCounts = classCounts
        self.impurityBefore = impurityBefore
        self.region = region
        self.candidates = candidates
        self.chosen = chosen
        self.impurityAfter = impurityAfter
        self.isLeaf = isLeaf
        self.leafReason = leafReason
        self.prediction = prediction
        self.probabilities = probabilities
    }
}

public struct TrainingResult: Sendable {
    public let steps: [TrainingStep]
    public let tree: TreeNode
    public let criterion: Criterion
    public let maxDepth: Int
    public let minSamplesLeaf: Int

    public init(steps: [TrainingStep], tree: TreeNode, criterion: Criterion, maxDepth: Int, minSamplesLeaf: Int) {
        self.steps = steps
        self.tree = tree
        self.criterion = criterion
        self.maxDepth = maxDepth
        self.minSamplesLeaf = minSamplesLeaf
    }
}

// MARK: - Trainer

public enum TreeTrainer {

    // MARK: train (BFS, recording every step)

    public static func train(
        dataset: Dataset,
        criterion: Criterion,
        maxDepth: Int,
        minSamplesLeaf: Int,
        maxCandidates: Int = 8
    ) -> TrainingResult {
        let samples = dataset.samples
        let numClasses = dataset.classNames.count
        let featureCount = dataset.featureNames.count

        var steps: [TrainingStep] = []
        var specs: [String: NodeSpec] = [:]
        var stepID = 0
        var candidateID = 0

        struct WorkItem {
            let nodeID: String
            let depth: Int
            let indices: [Int]
            let region: Region
        }

        let rootRegion = Region(
            minX: dataset.xRange.lowerBound,
            maxX: dataset.xRange.upperBound,
            minY: dataset.yRange.lowerBound,
            maxY: dataset.yRange.upperBound
        )

        var queue: [WorkItem] = [
            WorkItem(nodeID: "0", depth: 0, indices: Array(0..<samples.count), region: rootRegion)
        ]
        var head = 0

        while head < queue.count {
            let item = queue[head]
            head += 1

            let counts = classCounts(for: item.indices, samples: samples, numClasses: numClasses)
            let total = item.indices.count
            let impurity = criterion.impurity(classCounts: counts, total: total)
            let majority = argmax(counts)
            let probabilities = counts.map { Double($0) / Double(total) }

            let isPure = counts.filter { $0 > 0 }.count == 1
            let tooDeep = item.depth >= maxDepth
            let tooFew = total < 2 * minSamplesLeaf

            var candidates: [CandidateSplit] = []
            var chosen: CandidateSplit?
            var leafReason: String?

            if !isPure && !tooDeep && !tooFew {
                let found = findBestSplit(
                    indices: item.indices,
                    samples: samples,
                    featureCount: featureCount,
                    criterion: criterion,
                    minSamplesLeaf: minSamplesLeaf,
                    parentImpurity: impurity,
                    maxCandidates: maxCandidates,
                    nextCandidateID: &candidateID
                )
                candidates = found.candidates
                chosen = found.best
            }

            let isLeaf = (chosen == nil)
            if isLeaf {
                if isPure {
                    leafReason = "Every sample in this node belongs to the same class, so it is already pure and needs no further split."
                } else if tooDeep {
                    leafReason = "Reached the maximum depth (\(maxDepth)); stopping here to avoid overfitting."
                } else if tooFew {
                    leafReason = "Only \(total) samples here (fewer than \(2 * minSamplesLeaf)), too few to split into two large-enough children."
                } else {
                    leafReason = "No valid split lowers the impurity any further."
                }
            }

            var impurityAfter: Double?
            if let c = chosen {
                impurityAfter = (Double(c.leftCount) / Double(total)) * c.leftImpurity
                    + (Double(c.rightCount) / Double(total)) * c.rightImpurity
            }

            let step = TrainingStep(
                id: stepID,
                nodeID: item.nodeID,
                depth: item.depth,
                sampleCount: total,
                classCounts: counts,
                impurityBefore: impurity,
                region: item.region,
                candidates: candidates,
                chosen: chosen,
                impurityAfter: impurityAfter,
                isLeaf: isLeaf,
                leafReason: leafReason,
                prediction: isLeaf ? majority : nil,
                probabilities: probabilities
            )
            steps.append(step)
            stepID += 1

            var spec = NodeSpec(
                nodeID: item.nodeID,
                isLeaf: isLeaf,
                prediction: isLeaf ? majority : nil,
                probabilities: probabilities,
                splitFeature: chosen?.feature,
                splitThreshold: chosen?.threshold,
                leftID: nil,
                rightID: nil,
                impurity: impurity,
                sampleCount: total,
                depth: item.depth,
                region: item.region
            )

            if let c = chosen, !isLeaf {
                let f = c.feature
                let t = c.threshold
                var leftIdx: [Int] = []
                var rightIdx: [Int] = []
                for k in item.indices {
                    if samples[k].features[f] < t {
                        leftIdx.append(k)
                    } else {
                        rightIdx.append(k)
                    }
                }

                let leftID = item.nodeID + "L"
                let rightID = item.nodeID + "R"
                spec.leftID = leftID
                spec.rightID = rightID

                var leftRegion = item.region
                var rightRegion = item.region
                if f == 0 {
                    leftRegion.maxX = t
                    rightRegion.minX = t
                } else {
                    leftRegion.maxY = t
                    rightRegion.minY = t
                }

                queue.append(WorkItem(nodeID: leftID, depth: item.depth + 1, indices: leftIdx, region: leftRegion))
                queue.append(WorkItem(nodeID: rightID, depth: item.depth + 1, indices: rightIdx, region: rightRegion))
            }

            specs[item.nodeID] = spec
        }

        let tree = assemble("0", specs: specs)
        return TrainingResult(
            steps: steps,
            tree: tree,
            criterion: criterion,
            maxDepth: maxDepth,
            minSamplesLeaf: minSamplesLeaf
        )
    }

    // MARK: find the best split (the core algorithm)

    static func findBestSplit(
        indices: [Int],
        samples: [Sample],
        featureCount: Int,
        criterion: Criterion,
        minSamplesLeaf: Int,
        parentImpurity: Double,
        maxCandidates: Int,
        nextCandidateID: inout Int
    ) -> (candidates: [CandidateSplit], best: CandidateSplit?) {
        let total = indices.count
        let numClasses = 2
        let totalCounts = classCounts(for: indices, samples: samples, numClasses: numClasses)
        var all: [CandidateSplit] = []

        for f in 0..<featureCount {
            let sorted = indices.sorted { samples[$0].features[f] < samples[$1].features[f] }
            var leftCounts = [Int](repeating: 0, count: numClasses)
            var i = 0
            while i < sorted.count {
                var j = i
                while j < sorted.count && samples[sorted[j]].features[f] == samples[sorted[i]].features[f] {
                    leftCounts[samples[sorted[j]].label] += 1
                    j += 1
                }
                let leftCount = j
                if j < sorted.count {
                    let v1 = samples[sorted[i]].features[f]
                    let v2 = samples[sorted[j]].features[f]
                    let threshold = (v1 + v2) / 2.0
                    let rightCount = total - leftCount
                    if leftCount >= minSamplesLeaf && rightCount >= minSamplesLeaf {
                        let leftImpurity = criterion.impurity(classCounts: leftCounts, total: leftCount)
                        var rightCounts = [Int](repeating: 0, count: numClasses)
                        for c in 0..<numClasses { rightCounts[c] = totalCounts[c] - leftCounts[c] }
                        let rightImpurity = criterion.impurity(classCounts: rightCounts, total: rightCount)
                        let weighted = (Double(leftCount) / Double(total)) * leftImpurity
                            + (Double(rightCount) / Double(total)) * rightImpurity
                        let gain = parentImpurity - weighted
                        all.append(CandidateSplit(
                            id: nextCandidateID,
                            feature: f,
                            threshold: threshold,
                            infoGain: gain,
                            leftCount: leftCount,
                            rightCount: rightCount,
                            leftImpurity: leftImpurity,
                            rightImpurity: rightImpurity
                        ))
                        nextCandidateID += 1
                    }
                }
                i = j
            }
        }

        let sortedAll = all.sorted { $0.infoGain > $1.infoGain }
        let top = Array(sortedAll.prefix(maxCandidates))
        return (top, sortedAll.first)
    }

    // MARK: assemble the tree

    private static func assemble(_ id: String, specs: [String: NodeSpec]) -> TreeNode {
        let s = specs[id]!
        if s.isLeaf {
            return TreeNode(
                nodeID: id,
                isLeaf: true,
                prediction: s.prediction,
                probabilities: s.probabilities,
                splitFeature: nil,
                splitThreshold: nil,
                left: nil,
                right: nil,
                impurity: s.impurity,
                sampleCount: s.sampleCount,
                depth: s.depth,
                region: s.region
            )
        }
        let left = assemble(s.leftID!, specs: specs)
        let right = assemble(s.rightID!, specs: specs)
        return TreeNode(
            nodeID: id,
            isLeaf: false,
            prediction: nil,
            probabilities: nil,
            splitFeature: s.splitFeature,
            splitThreshold: s.splitThreshold,
            left: left,
            right: right,
            impurity: s.impurity,
            sampleCount: s.sampleCount,
            depth: s.depth,
            region: s.region
        )
    }

    // MARK: helpers

    static func argmax(_ arr: [Int]) -> Int {
        var best = 0
        for i in 1..<arr.count where arr[i] > arr[best] { best = i }
        return best
    }

    static func classCounts(for indices: [Int], samples: [Sample], numClasses: Int) -> [Int] {
        var counts = [Int](repeating: 0, count: numClasses)
        for idx in indices { counts[samples[idx].label] += 1 }
        return counts
    }
}

// MARK: - Internal node spec (used while assembling the tree)

private struct NodeSpec {
    var nodeID: String
    var isLeaf: Bool
    var prediction: Int?
    var probabilities: [Double]?
    var splitFeature: Int?
    var splitThreshold: Double?
    var leftID: String?
    var rightID: String?
    var impurity: Double
    var sampleCount: Int
    var depth: Int
    var region: Region
}

// MARK: - Prediction

public struct PathHop: Identifiable, Sendable {
    public let id: String
    public let nodeID: String
    public let condition: String
    public let isLeaf: Bool
    public let result: String

    public init(id: String, nodeID: String, condition: String, isLeaf: Bool, result: String) {
        self.id = id
        self.nodeID = nodeID
        self.condition = condition
        self.isLeaf = isLeaf
        self.result = result
    }
}

public struct Prediction: Sendable {
    public let label: Int
    public let probabilities: [Double]
    public let path: [PathHop]

    public init(label: Int, probabilities: [Double], path: [PathHop]) {
        self.label = label
        self.probabilities = probabilities
        self.path = path
    }
}

extension TreeTrainer {
    /// Walks one sample down the tree, returning the predicted class, the leaf's
    /// class probabilities, and every stop along the way.
    public static func predict(
        tree: TreeNode,
        sample: Sample,
        featureNames: [String],
        classNames: [String]
    ) -> Prediction {
        var node = tree
        var hops: [PathHop] = []

        while true {
            if node.isLeaf {
                let label = node.prediction ?? 0
                let probs = node.probabilities ?? []
                let pct = probs.count == 2 ? String(format: "%.0f%%", probs[1] * 100) : "—"
                hops.append(PathHop(
                    id: "\(node.nodeID)-leaf",
                    nodeID: node.nodeID,
                    condition: "Reached a leaf node",
                    isLeaf: true,
                    result: "Prediction: \(classNames[label]) (positive-class probability \(pct))"
                ))
                return Prediction(label: label, probabilities: probs, path: hops)
            }

            let f = node.splitFeature!
            let t = node.splitThreshold!
            let v = sample.features[f]
            let goesLeft = v < t
            let name = featureNames[f]
            let op = goesLeft ? "<" : "≥"
            let answer = goesLeft ? "yes" : "no"
            hops.append(PathHop(
                id: "\(node.nodeID)-split",
                nodeID: node.nodeID,
                condition: "\(name) \(String(format: "%.2f", v)) \(op) \(String(format: "%.2f", t))? → \(answer)",
                isLeaf: false,
                result: ""
            ))
            node = goesLeft ? node.left! : node.right!
        }
    }
}

// MARK: - Evaluation

public struct EvalResult: Sendable {
    public let trainAccuracy: Double
    public let testAccuracy: Double
    public let testConfusion: [[Int]]
    public let classNames: [String]
    public let trainCount: Int
    public let testCount: Int

    public init(trainAccuracy: Double, testAccuracy: Double, testConfusion: [[Int]], classNames: [String], trainCount: Int, testCount: Int) {
        self.trainAccuracy = trainAccuracy
        self.testAccuracy = testAccuracy
        self.testConfusion = testConfusion
        self.classNames = classNames
        self.trainCount = trainCount
        self.testCount = testCount
    }
}

extension TreeTrainer {
    /// Splits off a fixed test fraction, trains on the rest, and reports the
    /// accuracy on both parts plus a confusion matrix on the test part.
    public static func evaluate(
        dataset: Dataset,
        criterion: Criterion,
        maxDepth: Int,
        minSamplesLeaf: Int,
        testFraction: Double = 0.2,
        seed: UInt64 = 7
    ) -> EvalResult {
        var rng = SplitMix64(seed: seed)
        var shuffled = dataset.samples
        for i in stride(from: shuffled.count - 1, through: 1, by: -1) {
            let j = Int(rng.next() % UInt64(i + 1))
            shuffled.swapAt(i, j)
        }

        let testCount = max(1, Int(Double(shuffled.count) * testFraction))
        let testSet = Array(shuffled.prefix(testCount))
        let trainSet = Array(shuffled.dropFirst(testCount))

        let trainDataset = Dataset(
            name: dataset.name,
            featureNames: dataset.featureNames,
            classNames: dataset.classNames,
            samples: trainSet,
            featureRanges: dataset.featureRanges,
            story: dataset.story
        )
        let result = train(dataset: trainDataset, criterion: criterion, maxDepth: maxDepth, minSamplesLeaf: minSamplesLeaf)
        let tree = result.tree

        func accuracy(on set: [Sample]) -> Double {
            var correct = 0
            for s in set {
                let p = predict(tree: tree, sample: s, featureNames: dataset.featureNames, classNames: dataset.classNames)
                if p.label == s.label { correct += 1 }
            }
            return set.isEmpty ? 0 : Double(correct) / Double(set.count)
        }

        var confusion = [[Int]](repeating: [Int](repeating: 0, count: dataset.classNames.count), count: dataset.classNames.count)
        for s in testSet {
            let p = predict(tree: tree, sample: s, featureNames: dataset.featureNames, classNames: dataset.classNames)
            confusion[s.label][p.label] += 1
        }

        return EvalResult(
            trainAccuracy: accuracy(on: trainSet),
            testAccuracy: accuracy(on: testSet),
            testConfusion: confusion,
            classNames: dataset.classNames,
            trainCount: trainSet.count,
            testCount: testSet.count
        )
    }
}
