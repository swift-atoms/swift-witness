// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-witness",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Witness",
            targets: ["Witness"]
        ),
        .library(
            name: "Witness Standard Library Integration",
            targets: ["Witness Standard Library Integration"]
        ),
        .library(
            name: "Witness Apple Foundation Integration",
            targets: ["Witness Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Witness",
            dependencies: []
        ),
        .target(
            name: "Witness Standard Library Integration",
            dependencies: ["Witness"]
        ),
        .target(
            name: "Witness Apple Foundation Integration",
            dependencies: [
                "Witness",
                "Witness Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Witness Tests",
            dependencies: ["Witness"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
