import SwiftUI
import UniformTypeIdentifiers
#if canImport(DecisionTrainerCore)
import DecisionTrainerCore
#endif

// MARK: - 1. What is a decision model

struct IntroView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PageHeader(title: "What Is a Decision Model?", subtitle: "Start with a tree that \"asks questions\", and you have supervised learning")

                ExplanationCard(title: "What is a decision model (decision tree)?", icon: "flowchart") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("A decision model — here, a decision tree — is a model shaped like a flowchart: it asks the input features a series of yes/no questions and finally reaches a leaf node that gives the answer.")
                        Text("With our fruit data, a trained tree might look like this:")
                        MiniTreeText(text: """
                        Sweetness ≥ 5.00?
                        ├─ yes → Sourness < 3.00?
                        │         ├─ yes → Recommended ✅
                        │         └─ no  → Not Recommended ❌
                        └─ no → Not Recommended ❌
                        """)
                        Text("\"Training\" means letting the computer work out, from a pile of examples whose answers are already known, which questions to ask and in what order, so it classifies fruit as accurately as possible. That is supervised learning.")
                    }
                }

                ExplanationCard(title: "What steps does training go through?", icon: "list.number") {
                    VStack(alignment: .leading, spacing: 8) {
                        Bullet(text: "① Prepare the dataset: collect examples of \"features + the correct answer\".")
                        Bullet(text: "② Measure purity: use entropy or Gini impurity to quantify how mixed a group of samples is.")
                        Bullet(text: "③ Find the best split: try every feature and every threshold, and pick the one with the largest information gain.")
                        Bullet(text: "④ Split recursively: repeat the same process on the left and right children until a stopping condition is met.")
                        Bullet(text: "⑤ Predict and evaluate: walk new samples down the tree, and check accuracy on data it has not seen.")
                    }
                }

                ExplanationCard(title: "Why look at it one step at a time?", icon: "eye") {
                    Text("Many tutorials only show you the final tree without explaining how each step in the middle was calculated. On the \"Step-by-Step Training\" page this app lays everything open: the candidate splits each node tried, the information gain it computed, and why a particular split was chosen — and in the end you train the tree yourself.")
                }
            }
            .padding(24)
            .frame(maxWidth: 900)
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - 2. The dataset

struct DatasetView: View {
    let model: AppModel

    @State private var showImporter = false

    private var dataset: Dataset { model.dataset }

    private var positiveCount: Int { dataset.samples.filter { $0.label == 1 }.count }
    private var negativeCount: Int { dataset.samples.count - positiveCount }

    private var importAlert: Binding<Bool> {
        Binding(
            get: { model.importError != nil },
            set: { newValue in if !newValue { model.importError = nil } }
        )
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PageHeader(title: "The Dataset", subtitle: "Where all learning starts: features, labels and samples")

                ExplanationCard(title: "What does training data look like?", icon: "tablecells") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(dataset.story)
                        Bullet(text: "Features: the model's inputs. Here they are two continuous values: \(dataset.featureNames[0]) and \(dataset.featureNames[1]).")
                        Bullet(text: "Label: the correct answer remapped to 0 / 1 — \(dataset.classNames[0]) = 0, \(dataset.classNames[1]) = 1.")
                        Bullet(text: "Sample: one row of data — one fruit's features plus its label.")
                        Bullet(text: "Training set: the batch of samples handed to the algorithm to learn from.")
                    }
                }

                ExplanationCard(title: "Use your own data", icon: "square.and.arrow.down") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Bring your own tiny dataset as a CSV file with three columns: feature X, feature Y, and a class label. An optional header row is fine; the two distinct labels are mapped to classes 0 and 1.")
                        MiniTreeText(text: """
                        sweetness,sourness,label
                        3.2,7.1,1
                        7.8,2.4,1
                        1.0,9.0,0
                        8.5,8.0,0
                        """)
                        HStack(spacing: 12) {
                            Button {
                                showImporter = true
                            } label: {
                                Label("Import CSV…", systemImage: "square.and.arrow.down")
                            }
                            Button {
                                model.useBuiltInDataset()
                            } label: {
                                Label("Use Built-in Dataset", systemImage: "arrow.counterclockwise")
                            }
                            .disabled(model.isUsingBuiltInDataset)
                            Spacer()
                            Text(model.dataset.name)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                }

                HStack(alignment: .top, spacing: 16) {
                    ExplanationCard(title: "Data distribution (scatter plot)", icon: "chart.scatter") {
                        ScatterCanvas(
                            samples: dataset.samples,
                            splitSteps: [],
                            highlightIndex: nil,
                            xRange: dataset.xRange,
                            yRange: dataset.yRange,
                            featureNames: dataset.featureNames,
                            classNames: dataset.classNames,
                            focusRegion: nil,
                            predictionPoint: nil,
                            dimOutsideFocus: false
                        )
                        .frame(height: 320)
                    }
                    VStack(spacing: 16) {
                        ExplanationCard(title: "Sample statistics", icon: "number") {
                            VStack(alignment: .leading, spacing: 6) {
                                statRow("Total samples", "\(dataset.samples.count)")
                                statRow("\(dataset.classNames[1]) (class 1)", "\(positiveCount)")
                                statRow("\(dataset.classNames[0]) (class 0)", "\(negativeCount)")
                                statRow("Positive share", String(format: "%.0f%%", Double(positiveCount) / Double(max(dataset.samples.count, 1)) * 100))
                            }
                        }
                        ExplanationCard(title: "What to notice", icon: "lightbulb") {
                            Text("Blue dots are \(dataset.classNames[0]); orange dots are \(dataset.classNames[1]). Notice the two orange regions surrounded by blue — that is the pattern the model has to discover. \(noiseNote)")
                        }
                    }
                }

                ExplanationCard(title: "The data, row by row (first 40)", icon: "list.bullet.rectangle") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(dataset.samples.count) samples in total; only the first 40 are shown.")
                        Table(dataset.samples.prefix(40)) {
                            TableColumn("#") { Text("\($0.id)").monospacedDigit() }
                            TableColumn(dataset.featureNames[0]) { Text(String(format: "%.2f", $0.x)).monospacedDigit() }
                            TableColumn(dataset.featureNames[1]) { Text(String(format: "%.2f", $0.y)).monospacedDigit() }
                            TableColumn("Label") { labelPill($0.label) }
                        }
                        .frame(height: 280)
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: 1000)
            .frame(maxWidth: .infinity)
        }
        .fileImporter(
            isPresented: $showImporter,
            allowedContentTypes: [.commaSeparatedText, .plainText, .data],
            allowsMultipleSelection: false
        ) { result in
            switch result {
            case .success(let urls):
                if let url = urls.first { model.importCSV(from: url) }
            case .failure(let error):
                model.importError = error.localizedDescription
            }
        }
        .alert("Import Failed", isPresented: importAlert) {
            Button("OK") { model.importError = nil }
        } message: {
            Text(model.importError ?? "")
        }
    }

    private var noiseNote: String {
        model.isUsingBuiltInDataset
            ? "About 4% of the labels were deliberately flipped (noise) to imitate imperfect real-world labelling."
            : "Rows are exactly as they appear in your CSV."
    }

    private func statRow(_ name: String, _ value: String) -> some View {
        HStack {
            Text(name).foregroundStyle(.secondary)
            Spacer()
            Text(value).fontWeight(.semibold).monospacedDigit()
        }
    }

    private func labelPill(_ label: Int) -> some View {
        Text(dataset.classNames[label])
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(Capsule().fill(label == 0 ? Color.blue.opacity(0.15) : Color.orange.opacity(0.15)))
            .foregroundStyle(label == 0 ? .blue : .orange)
    }
}

// MARK: - 3. Purity and impurity

struct ImpurityView: View {
    @State private var positiveProportion: Double = 0.5

    private var entropy: Double {
        guard positiveProportion > 0 && positiveProportion < 1 else { return 0 }
        return -(positiveProportion * log2(positiveProportion) + (1 - positiveProportion) * log2(1 - positiveProportion))
    }

    private var gini: Double {
        1 - (positiveProportion * positiveProportion + (1 - positiveProportion) * (1 - positiveProportion))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PageHeader(title: "Purity & Impurity", subtitle: "The first step of training: measuring how mixed a group of samples is")

                ExplanationCard(title: "What is \"impurity\"?", icon: "chart.pie") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("The core idea of a decision tree: every split should make the two sides purer, meaning samples of the same class end up together. To judge how pure a node is, we need a number.")
                        Bullet(text: "Pure (low impurity): a node contains almost only one class, so impurity is near 0.")
                        Bullet(text: "Mixed (high impurity): the two classes are evenly split, so impurity is at its maximum.")
                        Text("The two most common measures are entropy and Gini impurity. Their formulas are simple:")
                        FormulaBox(text: "Entropy   H = −Σ pᵢ · log₂(pᵢ)")
                        FormulaBox(text: "Gini      G = 1 − Σ pᵢ²")
                        Text("Here pᵢ is the fraction of class i in the node. Drag the slider below to feel how the numbers move:")
                    }
                }

                ExplanationCard(title: "Try it", icon: "slider.horizontal.3") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Proportion of the positive class p = \(String(format: "%.2f", positiveProportion))")
                            .contentTransition(.numericText())
                        Slider(value: $positiveProportion, in: 0...1)
                        HStack(spacing: 16) {
                            metricCard("Entropy H", entropy, max: 1.0)
                            metricCard("Gini G", gini, max: 0.5)
                        }
                        Text("When p = 0.5 (an even mix) the node is most mixed; when p = 0 or 1 (a single class) it is pure and the value is 0. That is what \"impurity\" means.")
                            .foregroundStyle(.secondary)
                    }
                    .animation(.easeInOut(duration: 0.18), value: positiveProportion)
                }

                ExplanationCard(title: "The shape of both measures", icon: "chart.xyaxis.line") {
                    VStack(alignment: .leading, spacing: 8) {
                        ImpurityCurveChart()
                            .frame(height: 220)
                        Text("The x-axis is the proportion p of one class; the y-axis is impurity. Gini peaks at 0.5 and entropy at 1, but both peak at p = 0.5. In practice the choice barely matters — the trained trees are usually almost identical.")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: 900)
            .frame(maxWidth: .infinity)
        }
    }

    private func metricCard(_ title: String, _ value: Double, max: Double) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title).font(.caption).foregroundStyle(.secondary)
            Text(String(format: "%.4f", value))
                .font(.title2.weight(.bold).monospacedDigit())
                .contentTransition(.numericText())
            ProgressView(value: value, total: max)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.accentColor.opacity(0.06)))
    }
}

/// The entropy vs Gini curves.
struct ImpurityCurveChart: View {
    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            let pad: CGFloat = 20

            func sx(_ p: Double) -> CGFloat { pad + CGFloat(p) * (w - 2 * pad) }
            func sy(_ v: Double) -> CGFloat { h - pad - CGFloat(v) * (h - 2 * pad) }

            var axis = Path()
            axis.move(to: CGPoint(x: pad, y: h - pad))
            axis.addLine(to: CGPoint(x: w - pad, y: h - pad))
            axis.addLine(to: CGPoint(x: pad, y: pad))
            context.stroke(axis, with: .color(Color.secondary.opacity(0.4)), lineWidth: 1)

            func curve(_ f: (Double) -> Double, _ color: Color) {
                var p = Path()
                let n = 100
                for i in 0...n {
                    let x = Double(i) / Double(n)
                    let pt = CGPoint(x: sx(x), y: sy(f(x)))
                    if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
                }
                context.stroke(p, with: .color(color), lineWidth: 2)
            }

            curve({ p in
                guard p > 0 && p < 1 else { return 0 }
                return -(p * log2(p) + (1 - p) * log2(1 - p))
            }, .blue)

            curve({ p in
                1 - (p * p + (1 - p) * (1 - p))
            }, .orange)
        }
    }
}

// MARK: - 4. Information gain and splits

struct GainView: View {
    let model: AppModel

    private var rootStep: TrainingStep {
        TreeTrainer.train(dataset: model.dataset, criterion: model.criterion, maxDepth: 1, minSamplesLeaf: 1).steps[0]
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PageHeader(title: "Information Gain & Splits", subtitle: "The second step of training: how do we know which split is best?")

                ExplanationCard(title: "From impurity to \"information gain\"", icon: "scissors") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("We now know how to measure how mixed a node is. Next: among many possible splits, how do we choose the best one?")
                        Bullet(text: "Candidate split: for each feature, sort the samples by value and test a threshold at the midpoint between adjacent distinct values.")
                        Bullet(text: "For example \"\(model.dataset.featureNames[0]) < 3.20?\" is one candidate split, dividing the samples into a left and a right half.")
                        Text("\"Information gain\" is the impurity before the split minus the weighted impurity of the two halves afterwards:")
                        FormulaBox(text: "Gain = I(parent) − [ (nLeft/n)·I(left) + (nRight/n)·I(right) ]")
                        Text("The larger the gain, the more mess the split cleans up. We choose the split with the largest gain.")
                    }
                }

                ExplanationCard(title: "The root node's actual candidates (computed with \(model.criterion.title))", icon: "tablecells.badge.ellipsis") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Below are the splits the algorithm actually tried at the root node, sorted by information gain (only the top few). Notice the first one — it becomes the tree's first question.")
                        candidateTable(rootStep)
                    }
                    .animation(.easeInOut(duration: 0.2), value: model.criterion)
                }

                ExplanationCard(title: "Why weight by size?", icon: "balance.scale") {
                    Text("Suppose a split carves 100 samples into 99 (very pure) and 1 (very mixed). Judging only by the plain average would let that single sample dominate; a weighted average — each side multiplied by its share of the samples — reflects the overall effect fairly.")
                }
            }
            .padding(24)
            .frame(maxWidth: 980)
            .frame(maxWidth: .infinity)
        }
    }

    private func candidateTable(_ step: TrainingStep) -> some View {
        VStack(spacing: 0) {
            HStack {
                headerCell("Feature", w: 110)
                headerCell("Threshold", w: 100)
                headerCell("Information gain", w: 120)
                headerCell("Left (yes)", w: 100)
                headerCell("Right (no)", w: 100)
                headerCell("Impurity before → after", w: 170)
            }
            Divider()
            if step.candidates.isEmpty {
                Text("(no candidate splits)").foregroundStyle(.secondary).padding(.vertical, 12)
            }
            ForEach(Array(step.candidates.enumerated()), id: \.element.id) { idx, c in
                HStack {
                    cell(model.dataset.featureNames[c.feature], w: 110, highlight: idx == 0)
                    cell(String(format: "%.2f", c.threshold), w: 100, highlight: idx == 0, mono: true)
                    cell(String(format: "%.4f", c.infoGain), w: 120, highlight: idx == 0, mono: true)
                    cell("\(c.leftCount)", w: 100, highlight: idx == 0, mono: true)
                    cell("\(c.rightCount)", w: 100, highlight: idx == 0, mono: true)
                    cell(String(format: "%.3f → %.3f", step.impurityBefore, (Double(c.leftCount) / Double(step.sampleCount)) * c.leftImpurity + (Double(c.rightCount) / Double(step.sampleCount)) * c.rightImpurity), w: 170, highlight: idx == 0, mono: true)
                }
                .background(idx == 0 ? Color.accentColor.opacity(0.12) : Color.clear)
                Divider()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func headerCell(_ text: String, w: CGFloat) -> some View {
        Text(text).font(.caption.weight(.semibold)).foregroundStyle(.secondary)
            .frame(width: w, alignment: .leading)
    }

    private func cell(_ text: String, w: CGFloat, highlight: Bool, mono: Bool = false) -> some View {
        Text(text)
            .font(mono ? .callout.monospacedDigit() : .callout)
            .fontWeight(highlight ? .bold : .regular)
            .frame(width: w, alignment: .leading)
    }
}
