import SwiftUI

// MARK: - Root view

struct RootView: View {
    @State private var model = AppModel()
    @State private var selection: AppSection? = .intro

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(AppSection.allCases) { section in
                    Label {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(section.title)
                            Text(section.subtitle)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 2)
                    } icon: {
                        Image(systemName: section.icon)
                    }
                    .tag(section)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Decision Trainer")
            .navigationSplitViewColumnWidth(min: 225, ideal: 255)
        } detail: {
            ZStack {
                detailView
            }
            .animation(.easeInOut(duration: 0.26), value: selection)
        }
        .frame(minWidth: 980, minHeight: 660)
    }

    @ViewBuilder
    private var detailView: some View {
        let section = selection ?? .intro
        Group {
            switch section {
            case .intro: IntroView()
            case .dataset: DatasetView(model: model)
            case .impurity: ImpurityView()
            case .gain: GainView(model: model)
            case .train: TrainView(model: model)
            case .predict: PredictView(model: model)
            case .evaluate: EvaluateView(model: model)
            }
        }
        .id(section)
        .transition(.asymmetric(
            insertion: .opacity.combined(with: .offset(y: 14)),
            removal: .opacity
        ))
    }
}

// MARK: - Shared UI components

/// A titled explanation card with an icon.
struct ExplanationCard<Content: View>: View {
    let title: String
    let icon: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label(title, systemImage: icon)
                .font(.title3.weight(.semibold))
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(nsColor: .controlBackgroundColor)))
        .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Color.secondary.opacity(0.2)))
    }
}

/// A monospaced formula box.
struct FormulaBox: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(.body, design: .monospaced).weight(.medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.accentColor.opacity(0.08)))
    }
}

/// A bulleted line.
struct Bullet: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•").foregroundStyle(.secondary)
            Text(text)
        }
    }
}

/// A page header.
struct PageHeader: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.largeTitle.weight(.bold))
            Text(subtitle)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}

/// A small decision tree drawn with monospaced text.
struct MiniTreeText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(.body, design: .monospaced))
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(nsColor: .textBackgroundColor)))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.secondary.opacity(0.25)))
    }
}
