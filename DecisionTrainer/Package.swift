// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DecisionTrainer",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "DecisionTrainer", targets: ["DecisionTrainer"])
    ],
    targets: [
        // 核心演算法（與 UI 分離，方便測試）
        .target(
            name: "DecisionTrainerCore",
            path: "Sources/DecisionTrainerCore"
        ),
        // 應用程式（SwiftUI 介面）
        .target(
            name: "DecisionTrainer",
            dependencies: ["DecisionTrainerCore"],
            path: "Sources/DecisionTrainer"
        ),
        // 測試
        .testTarget(
            name: "DecisionTrainerCoreTests",
            dependencies: ["DecisionTrainerCore"],
            path: "Tests/DecisionTrainerCoreTests"
        )
    ]
)
