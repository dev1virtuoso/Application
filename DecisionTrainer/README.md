# Decision Trainer

A native **macOS-only** SwiftUI teaching app that shows exactly how a decision model (a decision tree) is trained.

Its defining feature: **every step comes with an explanation** of what is being computed and why. In the end you can **train a small decision model yourself, step by step**, on your own computer.

## Features

The sidebar is organised into seven sections, from theory to practice:

1. **What Is a Decision Model** — decision trees and supervised learning at a glance.
2. **The Dataset** — features, labels, samples, training sets. Ships with a 2D "Fruit Recommendation" dataset (220 samples). **Import your own CSV** (see below).
3. **Purity & Impurity** — the entropy and Gini-impurity formulas, with an interactive demo.
4. **Information Gain & Splits** — how candidate splits are enumerated, scored by information gain, and the best one is chosen.
5. **Step-by-Step Training** (the core) — watch the tree grow one layer at a time:
   - the scatter plot shows the feature space being carved up by split lines;
   - the tree diagram grows new nodes in step;
   - each step shows the candidate splits that node tried and their information gains;
   - adjust the impurity criterion, max depth and min samples per leaf, and it retrains live.
6. **Making Predictions** — drag sliders to invent a new sample and see the full decision path and probability.
7. **Evaluating the Model** — training/test accuracy, a confusion matrix, and a discussion of overfitting.

Animated section transitions, tree nodes that pop in with a spring, and numeric value transitions make the learning flow pleasant.

## Requirements

- macOS 14 or newer (uses SwiftUI `@Observable`, `Table`, `contentTransition(.numericText())`).
- Xcode 15+ (or the Xcode Command Line Tools) with a Swift 5.9+ toolchain.
- Runs on Apple-silicon and Intel Macs. **Not** for iOS / iPadOS / Windows.

## How to run

### Option A — Swift Package Manager (quick development)

```bash
cd DecisionTrainer
swift run
```

### Option B — build a double-clickable `.app`

```bash
cd DecisionTrainer
./make-app.sh
open DecisionTrainer.app
```

### Option C — Xcode project

A ready-made project lives at `DecisionTrainer.xcodeproj` (generated from `project.yml` with
[XcodeGen](https://github.com/yonaskolb/XcodeGen)). Open it in Xcode and press Run, or build
from the command line:

```bash
cd DecisionTrainer
xcodebuild -project DecisionTrainer.xcodeproj -scheme DecisionTrainer -configuration Release build
```

If you change the source layout, regenerate the project with:

```bash
xcodegen generate
```

### Run the unit tests

```bash
cd DecisionTrainer
swift test
```

## Importing your own dataset

Click **Import CSV…** in the "The Dataset" section. The file must have three comma-separated
columns: **feature X, feature Y, label**. An optional header row is allowed. Labels may be
numbers or text — any two distinct labels are mapped to classes `0` and `1`.

```csv
x,y,label
3.2,7.1,1
7.8,2.4,1
1.0,9.0,0
8.5,8.0,0
```

A ready-to-try file is included at [`sample-dataset.csv`](sample-dataset.csv). After importing,
every section (training, prediction, evaluation) automatically uses the new data.

## Project structure

```
DecisionTrainer/
├── Package.swift                     # SPM package (library + executable + tests)
├── project.yml                       # XcodeGen spec for the .xcodeproj
├── DecisionTrainer.xcodeproj         # generated Xcode project
├── make-app.sh                       # assembles a double-clickable .app
├── sample-dataset.csv                # example CSV to import
├── Sources/
│   ├── DecisionTrainerCore/          # algorithm core (UI-free, unit-testable)
│   │   ├── Model.swift               # samples, datasets, impurity, built-in data, CSV loader
│   │   └── TreeTrainer.swift         # CART training (step trace), prediction, evaluation
│   └── DecisionTrainer/              # SwiftUI app
│       ├── main.swift                # manual NSApplication window bootstrap
│       ├── AppModel.swift            # app state, dataset import, partial tree
│       └── Views/                    # the seven sections
└── Tests/
    └── DecisionTrainerCoreTests/     # unit tests (including CSV import)
```

## How the algorithm works

The trainer implements a classic **CART** binary decision tree:

- **Impurity**: entropy `H = −Σ pᵢ·log₂(pᵢ)` or Gini `G = 1 − Σ pᵢ²`.
- **Best split**: for every feature and candidate threshold, compute information gain
  `Gain = I(parent) − [ (nLeft/n)·I(left) + (nRight/n)·I(right) ]` and pick the largest.
- **Recursive splitting**: done breadth-first (level by level), recording every candidate and
  choice so the UI can replay the growth step by step.
- **Stopping**: node already pure, maximum depth reached, or too few samples to split.

Everything is written in plain Swift with **no third-party machine-learning libraries** — the
whole point is that you can see every calculation.

## License

Same as the parent repository. Educational sample.
