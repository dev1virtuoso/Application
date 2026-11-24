import SwiftUI
#if canImport(DecisionTrainerCore)
import DecisionTrainerCore
#endif

// MARK: - 2D scatter plot (with split lines)

struct ScatterCanvas: View {
    let samples: [Sample]
    let splitSteps: [TrainingStep]
    let highlightIndex: Int?
    let xRange: ClosedRange<Double>
    let yRange: ClosedRange<Double>
    let featureNames: [String]
    let classNames: [String]
    var focusRegion: Region?
    var predictionPoint: (x: Double, y: Double)?
    var dimOutsideFocus: Bool = false

    var body: some View {
        VStack(spacing: 6) {
            Canvas { context, size in
                let xMin = xRange.lowerBound, xMax = xRange.upperBound
                let yMin = yRange.lowerBound, yMax = yRange.upperBound

                func sx(_ x: Double) -> CGFloat {
                    CGFloat((x - xMin) / (xMax - xMin)) * size.width
                }
                func sy(_ y: Double) -> CGFloat {
                    size.height - CGFloat((y - yMin) / (yMax - yMin)) * size.height
                }

                // Background
                context.fill(Path(CGRect(origin: .zero, size: size)),
                             with: .color(Color(nsColor: .textBackgroundColor)))

                // Region of the current node
                if let r = focusRegion {
                    let rect = CGRect(
                        x: sx(r.minX), y: sy(r.maxY),
                        width: sx(r.maxX) - sx(r.minX),
                        height: sy(r.minY) - sy(r.maxY)
                    )
                    context.fill(Path(rect), with: .color(Color.purple.opacity(0.10)))
                    context.stroke(Path(rect), with: .color(Color.purple.opacity(0.35)), lineWidth: 1)
                }

                // Split lines applied so far
                for (i, step) in splitSteps.enumerated() {
                    guard let c = step.chosen else { continue }
                    let r = step.region
                    var p = Path()
                    if c.feature == 0 {
                        let x = sx(c.threshold)
                        p.move(to: CGPoint(x: x, y: sy(r.minY)))
                        p.addLine(to: CGPoint(x: x, y: sy(r.maxY)))
                    } else {
                        let y = sy(c.threshold)
                        p.move(to: CGPoint(x: sx(r.minX), y: y))
                        p.addLine(to: CGPoint(x: sx(r.maxX), y: y))
                    }
                    let isHighlight = (i == highlightIndex)
                    context.stroke(p,
                                   with: .color(isHighlight ? Color.purple : Color.secondary.opacity(0.45)),
                                   lineWidth: isHighlight ? 3 : 1.3)
                }

                // Samples
                let radius: CGFloat = 3.2
                for s in samples {
                    let inside = focusRegion.map { r in
                        s.x >= r.minX && s.x <= r.maxX && s.y >= r.minY && s.y <= r.maxY
                    } ?? true
                    let color: Color = s.label == 0 ? .blue : .orange
                    let opacity: Double = (!inside && dimOutsideFocus) ? 0.16 : 0.85
                    let rect = CGRect(x: sx(s.x) - radius, y: sy(s.y) - radius,
                                      width: radius * 2, height: radius * 2)
                    context.fill(Path(ellipseIn: rect), with: .color(color.opacity(opacity)))
                }

                // Prediction point
                if let pp = predictionPoint {
                    let c = CGPoint(x: sx(pp.x), y: sy(pp.y))
                    context.stroke(Path(ellipseIn: CGRect(x: c.x - 6, y: c.y - 6, width: 12, height: 12)),
                                   with: .color(Color.purple), lineWidth: 2.5)
                    context.fill(Path(ellipseIn: CGRect(x: c.x - 2.5, y: c.y - 2.5, width: 5, height: 5)),
                                 with: .color(Color.purple))
                }
            }
            HStack(spacing: 14) {
                legendDot(.blue, "\(classNames[0]) (0)")
                legendDot(.orange, "\(classNames[1]) (1)")
                legendDot(.purple, "split line")
                Spacer()
                Text("x-axis: \(featureNames[0])   y-axis: \(featureNames[1])")
                    .font(.caption2).foregroundStyle(.secondary)
            }
        }
    }

    private func legendDot(_ color: Color, _ label: String) -> some View {
        HStack(spacing: 4) {
            Circle().fill(color).frame(width: 8, height: 8)
            Text(label).font(.caption2).foregroundStyle(.secondary)
        }
    }
}

// MARK: - Tree diagram (grows with each step)

struct PartialTreeView: View {
    let node: PartialNode
    let featureNames: [String]
    let classNames: [String]

    var body: some View {
        VStack(spacing: 8) {
            nodeBox
            if let left = node.left, let right = node.right {
                HStack(alignment: .top, spacing: 10) {
                    VStack(spacing: 6) {
                        Text("yes").font(.caption2.bold()).foregroundStyle(.green)
                        PartialTreeView(node: left, featureNames: featureNames, classNames: classNames)
                    }
                    VStack(spacing: 6) {
                        Text("no").font(.caption2.bold()).foregroundStyle(.red)
                        PartialTreeView(node: right, featureNames: featureNames, classNames: classNames)
                    }
                }
                .transition(.opacity.combined(with: .offset(y: -8)))
            }
        }
    }

    private var nodeBox: some View {
        VStack(spacing: 2) {
            if node.isFrontier {
                Text("pending…").font(.caption).foregroundStyle(.secondary)
            } else if node.isLeaf {
                Text(classNames[node.prediction ?? 0]).font(.caption.weight(.semibold))
                if let probs = node.probabilities, probs.count == 2 {
                    Text("positive \(String(format: "%.0f%%", probs[1] * 100))")
                        .font(.caption2).foregroundStyle(.secondary)
                }
            } else {
                Text(conditionText).font(.caption.weight(.semibold))
            }
            Text("\(node.sampleCount) samples").font(.system(size: 9)).foregroundStyle(.secondary)
        }
        .padding(8)
        .frame(minWidth: 96)
        .background(background)
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(border, style: borderStyle))
        .transition(.scale(scale: 0.7).combined(with: .opacity))
    }

    private var conditionText: String {
        guard let f = node.splitFeature, let t = node.splitThreshold else { return "" }
        return "\(featureNames[f]) < \(String(format: "%.2f", t))"
    }

    private var background: Color {
        if node.isFrontier { return Color.secondary.opacity(0.05) }
        if node.isLeaf {
            return node.prediction == 0 ? Color.blue.opacity(0.14) : Color.orange.opacity(0.16)
        }
        return Color(nsColor: .controlBackgroundColor)
    }

    private var border: Color {
        if node.isFrontier { return Color.secondary.opacity(0.4) }
        if node.isLeaf {
            return node.prediction == 0 ? Color.blue.opacity(0.5) : Color.orange.opacity(0.55)
        }
        return Color.secondary.opacity(0.4)
    }

    private var borderStyle: StrokeStyle {
        node.isFrontier ? StrokeStyle(lineWidth: 1, dash: [4, 3]) : StrokeStyle(lineWidth: 1)
    }
}

// MARK: - 5. Step-by-step training (the core interactive page)

struct TrainView: View {
    @Bindable var model: AppModel

    private var step: TrainingStep { model.step }

    private var splitSteps: [TrainingStep] {
        model.result.steps.prefix(model.currentStep + 1).filter { !$0.isLeaf }
    }

    private var highlightIndex: Int? {
        step.isLeaf ? nil : splitSteps.count - 1
    }

    private var partialTree: PartialNode {
        StepTree.partialTree(steps: model.result.steps, upTo: model.currentStep)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PageHeader(title: "Step-by-Step Training", subtitle: "Watch a decision tree grow one step at a time")

                controlsCard
                stepExplanationCard

                HStack(alignment: .top, spacing: 16) {
                    ExplanationCard(title: "How the feature space gets carved up", icon: "chart.scatter") {
                        ScatterCanvas(
                            samples: model.dataset.samples,
                            splitSteps: splitSteps,
                            highlightIndex: highlightIndex,
                            xRange: model.dataset.xRange,
                            yRange: model.dataset.yRange,
                            featureNames: model.dataset.featureNames,
                            classNames: model.dataset.classNames,
                            focusRegion: step.region,
                            predictionPoint: nil,
                            dimOutsideFocus: true
                        )
                        .frame(height: 340)
                    }
                    ExplanationCard(title: "The tree so far", icon: "point.3.connected.trianglepath.dotted") {
                        ScrollView([.horizontal, .vertical]) {
                            PartialTreeView(node: partialTree,
                                            featureNames: model.dataset.featureNames,
                                            classNames: model.dataset.classNames)
                                .padding(12)
                        }
                        .frame(height: 340)
                        .animation(.spring(response: 0.45, dampingFraction: 0.72), value: model.currentStep)
                    }
                }

                navigationCard
            }
            .padding(24)
            .frame(maxWidth: 1120)
            .frame(maxWidth: .infinity)
        }
    }

    // MARK: Controls

    private var controlsCard: some View {
        ExplanationCard(title: "Training parameters (changing these retrains automatically)", icon: "slider.horizontal.3") {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Impurity criterion").font(.caption).foregroundStyle(.secondary)
                        Picker("", selection: $model.criterion) {
                            ForEach(Criterion.allCases) { c in
                                Text(c.title).tag(c)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 260)
                        .onChange(of: model.criterion) { _, _ in model.retrain() }
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Stepper("Max depth: \(model.maxDepth)", value: $model.maxDepth, in: 1...8)
                            .onChange(of: model.maxDepth) { _, _ in model.retrain() }
                        Stepper("Min samples per leaf: \(model.minSamplesLeaf)", value: $model.minSamplesLeaf, in: 1...12)
                            .onChange(of: model.minSamplesLeaf) { _, _ in model.retrain() }
                    }
                }
                HStack(spacing: 12) {
                    Button("Retrain") { model.retrain() }
                    Text("Changing parameters (for example limiting the depth) directly affects how deep the tree grows — this is the key to controlling overfitting.")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: Step explanation

    @ViewBuilder
    private var stepExplanationCard: some View {
        ExplanationCard(
            title: "Step \(model.currentStep + 1) of \(model.totalSteps) — processing node \"\(StepTree.friendlyName(step.nodeID))\" (depth \(step.depth))",
            icon: step.isLeaf ? "checkmark.circle" : "scissors"
        ) {
            if step.isLeaf {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What this step does: decide whether this node should stop and become a leaf.")
                        .font(.body.weight(.medium))
                    Text(step.leafReason ?? "")
                    if let pred = step.prediction {
                        Text("This leaf's conclusion: \(model.dataset.classNames[pred]). Any new sample that reaches here will get this answer.")
                            .font(.callout.weight(.semibold))
                    }
                }
            } else if let c = step.chosen {
                VStack(alignment: .leading, spacing: 10) {
                    Text("What this step does: try every feature and every possible threshold, compute the information gain, and pick the split with the largest gain.")
                        .font(.body.weight(.medium))

                    HStack(spacing: 8) {
                        Text("Best split:")
                        Text("\(model.dataset.featureNames[c.feature]) < \(String(format: "%.2f", c.threshold))")
                            .font(.callout.weight(.bold))
                            .padding(.horizontal, 10).padding(.vertical, 4)
                            .background(Capsule().fill(Color.purple.opacity(0.14)))
                            .contentTransition(.numericText())
                    }
                    Bullet(text: "Information gain: \(String(format: "%.4f", c.infoGain))")
                    Bullet(text: "Impurity \(String(format: "%.3f", step.impurityBefore)) → \(String(format: "%.3f", step.impurityAfter ?? 0))")
                    Bullet(text: "Split result: \(c.leftCount) samples left (yes), \(c.rightCount) samples right (no)")

                    Text("Candidate splits tried (sorted by information gain):")
                        .font(.caption).foregroundStyle(.secondary)
                        .padding(.top, 4)
                    candidateList
                }
                .animation(.easeInOut(duration: 0.2), value: step.id)
            }
        }
    }

    private var candidateList: some View {
        VStack(spacing: 0) {
            ForEach(Array(step.candidates.prefix(6).enumerated()), id: \.element.id) { idx, c in
                HStack(spacing: 12) {
                    Text(idx == 0 ? "★" : " ").foregroundStyle(.purple).frame(width: 12)
                    Text("\(model.dataset.featureNames[c.feature]) < \(String(format: "%.2f", c.threshold))")
                        .font(.callout.monospacedDigit())
                        .frame(width: 140, alignment: .leading)
                    Text("gain \(String(format: "%.4f", c.infoGain))")
                        .font(.callout.monospacedDigit())
                        .foregroundStyle(idx == 0 ? .primary : .secondary)
                        .contentTransition(.numericText())
                    Text("left \(c.leftCount) / right \(c.rightCount)")
                        .font(.caption.monospacedDigit())
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 3)
                if idx < min(6, step.candidates.count) - 1 {
                    Divider()
                }
            }
            if step.candidates.isEmpty {
                Text("(no candidate splits)").foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Step navigation

    private var navigationCard: some View {
        ExplanationCard(title: "Step controls", icon: "play.fill") {
            VStack(spacing: 12) {
                ProgressView(value: Double(model.currentStep + 1), total: Double(model.totalSteps))
                    .animation(.easeInOut(duration: 0.25), value: model.currentStep)
                HStack(spacing: 12) {
                    Button { model.prevStep() } label: { Label("Previous", systemImage: "arrow.left") }
                        .disabled(model.currentStep == 0)
                    Button { model.nextStep() } label: { Label("Next", systemImage: "arrow.right") }
                        .disabled(model.currentStep >= model.totalSteps - 1)
                    Button { model.finish() } label: { Label("Finish", systemImage: "forward.end.fill") }
                        .disabled(model.currentStep >= model.totalSteps - 1)
                    Button { model.resetToStart() } label: { Label("Back to Start", systemImage: "backward.end.fill") }
                        .disabled(model.currentStep == 0)
                    Spacer()
                    Text("Step \(model.currentStep + 1) / \(model.totalSteps)")
                        .font(.callout.monospacedDigit()).foregroundStyle(.secondary)
                }
                Text("Press Next to watch the tree grow one layer at a time: the scatter plot on the left shows the feature space being carved up by split lines, while the tree diagram on the right grows new nodes in step. The purple region is the node currently being processed.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }
    }
}
