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

        .library(name: "Witness Foundation Integration", targets: ["Witness Foundation Integration"]),
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
            name: "Witness Foundation Integration",
            dependencies: [
                .target(name: "Witness"),
            ],
            path: "Sources/Witness Foundation Integration"
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
                .target(name: "Witness Foundation Integration"),
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
