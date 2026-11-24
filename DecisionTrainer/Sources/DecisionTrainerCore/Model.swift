import Foundation

// MARK: - Samples and datasets

/// One training sample: a set of numeric features plus a class label.
public struct Sample: Identifiable, Hashable, Sendable {
    public let id: Int
    public let features: [Double]
    public let label: Int

    public init(id: Int, features: [Double], label: Int) {
        self.id = id
        self.features = features
        self.label = label
    }

    // This app uses exactly two features so it can be plotted on a plane.
    public var x: Double { features[0] }
    public var y: Double { features[1] }
}

/// A dataset: the samples, feature names, class names and the 2D plotting ranges.
public struct Dataset: Sendable {
    public let name: String
    public let featureNames: [String]
    public let classNames: [String]
    public let samples: [Sample]
    public let featureRanges: [ClosedRange<Double>]
    public let story: String

    public init(
        name: String,
        featureNames: [String],
        classNames: [String],
        samples: [Sample],
        featureRanges: [ClosedRange<Double>],
        story: String
    ) {
        self.name = name
        self.featureNames = featureNames
        self.classNames = classNames
        self.samples = samples
        self.featureRanges = featureRanges
        self.story = story
    }

    public var xRange: ClosedRange<Double> { featureRanges[0] }
    public var yRange: ClosedRange<Double> { featureRanges[1] }
}

// MARK: - Deterministic pseudo-random number generator (SplitMix64)

/// Seeded random number generator so the built-in dataset is identical on
/// every launch and the tutorial text always matches the data.
public struct SplitMix64: Sendable {
    private var state: UInt64

    public init(seed: UInt64) { state = seed }

    public mutating func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }

    public mutating func nextDouble() -> Double {
        Double(next()) / Double(UInt64.max)
    }
}

// MARK: - Built-in dataset

public enum DatasetFactory {
    /// Builds the "Fruit Recommendation" teaching dataset.
    ///
    /// Ground truth (deliberately hidden from the model, which must learn it):
    /// - Region A: sweetness in [2.5, 5.5] and sourness in [3.0, 8.0] -> recommend
    /// - Region B: sweetness in [6.5, 9.0] and sourness in [1.0, 4.0] -> recommend
    /// - everything else -> do not recommend
    /// About 4% of the labels are flipped to simulate noisy, real-world data.
    public static func makeFruitRecommendation(seed: UInt64 = 42) -> Dataset {
        var rng = SplitMix64(seed: seed)

        func groundTruth(_ x: Double, _ y: Double) -> Int {
            if x >= 2.5 && x <= 5.5 && y >= 3.0 && y <= 8.0 { return 1 }
            if x >= 6.5 && x <= 9.0 && y >= 1.0 && y <= 4.0 { return 1 }
            return 0
        }

        var samples: [Sample] = []
        let count = 220
        for i in 0..<count {
            let x = rng.nextDouble() * 10.0
            let y = rng.nextDouble() * 10.0
            var label = groundTruth(x, y)
            if rng.nextDouble() < 0.04 { label = 1 - label } // 4% label noise
            samples.append(Sample(id: i, features: [x, y], label: label))
        }

        return Dataset(
            name: "Fruit Recommendation Dataset",
            featureNames: ["Sweetness", "Sourness"],
            classNames: ["Not Recommended", "Recommended"],
            samples: samples,
            featureRanges: [0...10, 0...10],
            story: "Imagine you run an orchard. You recorded 220 fruits, each with a sweetness score and a sourness score (0–10), and marked whether each fruit is worth recommending. The model must learn to infer, from these two features, whether a new fruit should be recommended."
        )
    }
}

// MARK: - Node region (for 2D visualisation)

/// The rectangular region a node covers in feature space, narrowed down by the
/// splits of its ancestors.
public struct Region: Sendable, Equatable {
    public var minX: Double
    public var maxX: Double
    public var minY: Double
    public var maxY: Double

    public init(minX: Double, maxX: Double, minY: Double, maxY: Double) {
        self.minX = minX
        self.maxX = maxX
        self.minY = minY
        self.maxY = maxY
    }
}

// MARK: - Impurity criteria

/// Measures how "mixed" a group of samples is. Larger values mean more mixed.
public enum Criterion: String, CaseIterable, Identifiable, Sendable {
    case entropy
    case gini

    public var id: String { rawValue }

    public var title: String {
        switch self {
        case .entropy: return "Entropy"
        case .gini: return "Gini Impurity"
        }
    }

    public var symbol: String {
        switch self {
        case .entropy: return "H"
        case .gini: return "G"
        }
    }

    public var formula: String {
        switch self {
        case .entropy: return "H = −Σ pᵢ · log₂(pᵢ)"
        case .gini: return "G = 1 − Σ pᵢ²"
        }
    }

    /// Computes the impurity. `classCounts` holds per-class sample counts, `total` the sum.
    public func impurity(classCounts: [Int], total: Int) -> Double {
        guard total > 0 else { return 0 }
        var result = 0.0
        for c in classCounts {
            let p = Double(c) / Double(total)
            guard p > 0 else { continue }
            switch self {
            case .entropy:
                result -= p * log2(p)
            case .gini:
                result += p * p
            }
        }
        if case .gini = self { result = 1 - result }
        return result
    }
}

// MARK: - CSV import

public enum DatasetImportError: Error, LocalizedError {
    case emptyFile
    case noDataRows
    case badColumnCount(line: Int)
    case nonNumeric(line: Int, column: Int, value: String)
    case needsExactlyTwoClasses(found: [String])
    case unreadableFile(String)

    public var errorDescription: String? {
        switch self {
        case .emptyFile:
            return "The file is empty."
        case .noDataRows:
            return "No data rows were found (the header row does not count)."
        case .badColumnCount(let line):
            return "Line \(line): expected 3 comma-separated columns (x, y, label)."
        case .nonNumeric(let line, let column, let value):
            return "Line \(line): column \(column) value \"\(value)\" is not a number."
        case .needsExactlyTwoClasses(let found):
            return "Expected exactly 2 distinct class labels, but found \(found.count): \(found.joined(separator: ", "))."
        case .unreadableFile(let message):
            return "Could not read the file: \(message)"
        }
    }
}

public enum DatasetLoader {
    /// Example CSV that matches the expected format.
    public static let sampleCSV = """
    x,y,label
    2.0,4.0,1
    7.5,2.0,1
    1.0,9.0,0
    8.5,8.0,0
    """

    /// Reads a CSV file from disk and turns it into a dataset.
    public static func load(from url: URL) throws -> Dataset {
        let text: String
        do {
            text = try String(contentsOf: url, encoding: .utf8)
        } catch {
            if let data = try? Data(contentsOf: url),
               let decoded = String(data: data, encoding: .isoLatin1) {
                text = decoded
            } else {
                throw DatasetImportError.unreadableFile(error.localizedDescription)
            }
        }
        let name = url.deletingPathExtension().lastPathComponent
        return try parse(text: text, name: name)
    }

    /// Parses CSV text. Accepts an optional header row and exactly 3 columns:
    /// `featureX, featureY, label`. Labels may be numbers or text; any two
    /// distinct labels are mapped to classes 0 and 1.
    public static func parse(text: String, name: String = "Imported Dataset") throws -> Dataset {
        let rawLines = text.split(whereSeparator: \.isNewline).map(String.init)
        let lines: [(number: Int, text: String)] = rawLines.enumerated().compactMap { idx, line in
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed.isEmpty ? nil : (idx + 1, trimmed)
        }
        guard !lines.isEmpty else { throw DatasetImportError.emptyFile }

        // Header detection: if the first row's first two columns are not numeric,
        // treat it as a header row.
        var startIndex = 0
        if let first = lines.first {
            let cols = splitCSV(first.text)
            if cols.count >= 2, Double(cols[0]) == nil || Double(cols[1]) == nil {
                startIndex = 1
            }
        }

        var rows: [(line: Int, x: Double, y: Double, label: String)] = []
        for (lineNumber, raw) in lines[startIndex...] {
            let cols = splitCSV(raw)
            guard cols.count >= 3 else { throw DatasetImportError.badColumnCount(line: lineNumber) }
            guard let x = Double(cols[0]) else {
                throw DatasetImportError.nonNumeric(line: lineNumber, column: 1, value: cols[0])
            }
            guard let y = Double(cols[1]) else {
                throw DatasetImportError.nonNumeric(line: lineNumber, column: 2, value: cols[1])
            }
            let label = cols[2].trimmingCharacters(in: .whitespaces)
            rows.append((lineNumber, x, y, label))
        }
        guard !rows.isEmpty else { throw DatasetImportError.noDataRows }

        // Establish the two classes (numeric labels sort numerically).
        let unique = Array(Set(rows.map { $0.label })).sorted { a, b in
            if let da = Double(a), let db = Double(b) { return da < db }
            return a < b
        }
        guard unique.count == 2 else {
            throw DatasetImportError.needsExactlyTwoClasses(found: unique)
        }
        let labelToIndex: [String: Int] = [unique[0]: 0, unique[1]: 1]

        let samples = rows.enumerated().map { index, row in
            Sample(id: index, features: [row.x, row.y], label: labelToIndex[row.label]!)
        }

        let xs = samples.map { $0.x }
        let ys = samples.map { $0.y }
        let xRange = paddedRange(xs)
        let yRange = paddedRange(ys)

        return Dataset(
            name: name.isEmpty ? "Imported Dataset" : name,
            featureNames: ["Feature X", "Feature Y"],
            classNames: unique,
            samples: samples,
            featureRanges: [xRange, yRange],
            story: "Imported from CSV: \(samples.count) samples with 2 numeric features and a binary label (\(unique[0]) / \(unique[1]))."
        )
    }

    private static func paddedRange(_ values: [Double]) -> ClosedRange<Double> {
        let lo = values.min() ?? 0
        let hi = values.max() ?? 1
        let span = hi - lo
        let pad = span > 0 ? span * 0.05 : 1.0
        return (lo - pad)...(hi + pad)
    }

    /// Splits one CSV line, respecting double-quoted fields.
    private static func splitCSV(_ line: String) -> [String] {
        var result: [String] = []
        var current = ""
        var inQuotes = false
        var index = line.startIndex
        while index < line.endIndex {
            let ch = line[index]
            if ch == "\"" {
                inQuotes.toggle()
            } else if ch == "," && !inQuotes {
                result.append(current.trimmingCharacters(in: .whitespaces))
                current = ""
            } else {
                current.append(ch)
            }
            index = line.index(after: index)
        }
        result.append(current.trimmingCharacters(in: .whitespaces))
        return result
    }
}
