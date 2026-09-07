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
        .library(name: "Witness", targets: ["Witness"]),
        .library(name: "Witness Standard Library Integration", targets: ["Witness Standard Library Integration"]),
        .library(name: "Witness Foundation Library Integration", targets: ["Witness Foundation Library Integration"]),
        .library(name: "Witness Test Support", targets: ["Witness Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Witness",
            dependencies: [
            ],
            path: "Sources/Witness"
        ),
        .target(
            name: "Witness Standard Library Integration",
            dependencies: [
                .target(name: "Witness"),
            ],
            path: "Sources/Witness Standard Library Integration"
        ),
        .target(
            name: "Witness Foundation Library Integration",
            dependencies: [
                .target(name: "Witness"),
                .target(name: "Witness Standard Library Integration"),
            ],
            path: "Sources/Witness Foundation Library Integration"
        ),
        .target(
            name: "Witness Test Support",
            dependencies: [
                .target(name: "Witness"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Witness Tests",
            dependencies: [
                .target(name: "Witness"),
                .target(name: "Witness Test Support"),
                .target(name: "Witness Standard Library Integration"),
                .target(name: "Witness Foundation Library Integration"),
            ],
            path: "Tests/Witness Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
