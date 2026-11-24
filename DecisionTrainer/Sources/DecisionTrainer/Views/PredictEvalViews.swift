import SwiftUI
#if canImport(DecisionTrainerCore)
import DecisionTrainerCore
#endif

// MARK: - 6. Making predictions

struct PredictView: View {
    @Bindable var model: AppModel

    private var splitSteps: [TrainingStep] {
        model.result.steps.filter { !$0.isLeaf }
    }

    private var prediction: Prediction { model.prediction }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PageHeader(title: "Making Predictions", subtitle: "Once trained, walk a new fruit down the tree and see where it lands")

                ExplanationCard(title: "How prediction works: walk down the tree", icon: "arrow.turn.down.right") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Prediction is refreshingly simple: start at the root node, answer each split's question — \"yes\" goes left, \"no\" goes right — until you reach a leaf node, whose conclusion is the prediction.")
                        Text("Drag the sliders to invent a fruit with any \(model.dataset.featureNames[0].lowercased()) and \(model.dataset.featureNames[1].lowercased()) combination; the right side shows every stop it makes.")
                    }
                }

                HStack(alignment: .top, spacing: 16) {
                    ExplanationCard(title: "Adjust the new sample", icon: "slider.horizontal.3") {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(model.dataset.featureNames[0]): \(String(format: "%.2f", model.predictX))")
                                    .font(.callout.monospacedDigit())
                                    .contentTransition(.numericText())
                                Slider(value: $model.predictX, in: model.dataset.xRange)
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(model.dataset.featureNames[1]): \(String(format: "%.2f", model.predictY))")
                                    .font(.callout.monospacedDigit())
                                    .contentTransition(.numericText())
                                Slider(value: $model.predictY, in: model.dataset.yRange)
                            }

                            Divider()
                            resultBanner
                            Divider()
                            Text("Decision path:")
                                .font(.caption.weight(.semibold)).foregroundStyle(.secondary)
                            VStack(alignment: .leading, spacing: 6) {
                                ForEach(prediction.path) { hop in
                                    HStack(alignment: .top, spacing: 8) {
                                        Image(systemName: hop.isLeaf ? "flag.checkered" : "arrow.right.circle")
                                            .foregroundStyle(hop.isLeaf ? .purple : .secondary)
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(hop.condition)
                                                .font(.callout)
                                            if !hop.result.isEmpty {
                                                Text(hop.result).font(.callout.weight(.semibold)).foregroundStyle(.purple)
                                            }
                                        }
                                    }
                                    .transition(.opacity)
                                }
                            }
                        }
                        .animation(.easeInOut(duration: 0.18), value: prediction.label)
                    }

                    ExplanationCard(title: "Where it sits in feature space", icon: "chart.scatter") {
                        ScatterCanvas(
                            samples: model.dataset.samples,
                            splitSteps: splitSteps,
                            highlightIndex: nil,
                            xRange: model.dataset.xRange,
                            yRange: model.dataset.yRange,
                            featureNames: model.dataset.featureNames,
                            classNames: model.dataset.classNames,
                            focusRegion: nil,
                            predictionPoint: (model.predictX, model.predictY),
                            dimOutsideFocus: false
                        )
                        .frame(height: 420)
                        Text("The purple ring is your new sample; every purple line is a learned decision boundary. Whichever region the sample falls in, it is classified by that region's leaf node.")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: 1080)
            .frame(maxWidth: .infinity)
        }
    }

    private var resultBanner: some View {
        let label = model.dataset.classNames[prediction.label]
        let pct = prediction.probabilities.count == 2 ? String(format: "%.0f%%", prediction.probabilities[1] * 100) : "—"
        return VStack(alignment: .leading, spacing: 4) {
            Text("Prediction").font(.caption).foregroundStyle(.secondary)
            HStack(spacing: 8) {
                Text(label)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(prediction.label == 0 ? .blue : .orange)
                    .contentTransition(.opacity)
                Text("positive probability \(pct)")
                    .font(.callout.monospacedDigit())
                    .foregroundStyle(.secondary)
                    .contentTransition(.numericText())
            }
        }
    }
}

// MARK: - 7. Evaluating the model

struct EvaluateView: View {
    @Bindable var model: AppModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                PageHeader(title: "Evaluating the Model", subtitle: "However well it learns, a model must be checked on data it has never seen")

                ExplanationCard(title: "Why evaluate at all?", icon: "checkmark.seal") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("If you score a model only on the data it trained on, it can simply memorize the answers and get full marks — yet fail on new fruit. That is overfitting.")
                        Bullet(text: "Training set: the samples used to learn (here, 80%).")
                        Bullet(text: "Test set: samples the model has never seen (here, 20%).")
                        Bullet(text: "Accuracy: the fraction of correct predictions.")
                        Bullet(text: "Confusion matrix: breaks correct/incorrect down by class, showing where the model tends to go wrong.")
                        Text("Press \"Run Evaluation\" to split off a test set, retrain, and report the results.")
                    }
                }

                HStack(spacing: 16) {
                    ExplanationCard(title: "Run evaluation", icon: "play.circle") {
                        VStack(alignment: .leading, spacing: 12) {
                            Button {
                                model.runEvaluation()
                            } label: {
                                Label("Run Evaluation", systemImage: "play.fill")
                                    .frame(maxWidth: .infinity)
                            }
                            .controlSize(.large)
                            Text("Current settings: \(model.criterion.title), max depth \(model.maxDepth), min samples per leaf \(model.minSamplesLeaf)")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    if let e = model.evalResult {
                        ExplanationCard(title: "Accuracy", icon: "gauge") {
                            HStack(spacing: 20) {
                                accuracyBox("Training accuracy", e.trainAccuracy)
                                accuracyBox("Test accuracy", e.testAccuracy)
                            }
                            Text("If training accuracy is far above test accuracy, the model has started memorizing (overfitting). Try lowering the max depth — test accuracy often goes up instead.")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.98)))
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: model.evalResult?.testCount)

                if let e = model.evalResult {
                    ExplanationCard(title: "Test-set confusion matrix (\(e.testCount) samples)", icon: "grid") {
                        confusionMatrix(e)
                    }
                    .transition(.opacity.combined(with: .offset(y: 10)))
                }
            }
            .padding(24)
            .frame(maxWidth: 980)
            .frame(maxWidth: .infinity)
            .animation(.easeInOut(duration: 0.25), value: model.evalResult?.testCount)
        }
    }

    private func accuracyBox(_ title: String, _ value: Double) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title).font(.caption).foregroundStyle(.secondary)
            Text(String(format: "%.1f%%", value * 100))
                .font(.title.weight(.bold).monospacedDigit())
                .contentTransition(.numericText())
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.accentColor.opacity(0.07)))
    }

    private func confusionMatrix(_ e: EvalResult) -> some View {
        let names = e.classNames
        return VStack(alignment: .leading, spacing: 6) {
            Text("rows = actual, columns = predicted")
                .font(.caption).foregroundStyle(.secondary)
            HStack(spacing: 8) {
                Text("").frame(width: 120, alignment: .leading)
                ForEach(0..<names.count, id: \.self) { j in
                    Text("predicted \(names[j])").font(.caption.weight(.semibold))
                        .frame(width: 130, alignment: .center)
                }
            }
            ForEach(0..<names.count, id: \.self) { i in
                HStack(spacing: 8) {
                    Text("actual \(names[i])").font(.caption.weight(.semibold))
                        .frame(width: 120, alignment: .leading)
                    ForEach(0..<names.count, id: \.self) { j in
                        let value = e.testConfusion[i][j]
                        Text("\(value)")
                            .font(.callout.monospacedDigit().bold())
                            .frame(width: 130, height: 40)
                            .background(RoundedRectangle(cornerRadius: 8).fill(cellColor(i: i, j: j, value: value)))
                            .contentTransition(.numericText())
                    }
                }
            }
            Text("The diagonal (top-left and bottom-right) holds the correct counts; off-diagonal cells are mistakes.")
                .font(.caption).foregroundStyle(.secondary)
        }
    }

    private func cellColor(i: Int, j: Int, value: Int) -> Color {
        if i == j {
            return value > 0 ? Color.green.opacity(0.18) : Color.secondary.opacity(0.05)
        }
        return value > 0 ? Color.red.opacity(0.16) : Color.secondary.opacity(0.05)
    }
}
