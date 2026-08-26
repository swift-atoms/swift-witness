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
            name: "Witness Test Support",
            targets: ["Witness Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-standard-library-extensions.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "Witness",
            dependencies: [
                .product(
                    name: "Standard Library Extensions",
                    package: "swift-standard-library-extensions"
                )
            ]
        ),
        .target(
            name: "Witness Test Support",
            dependencies: [
                "Witness",
                .product(
                    name: "Standard Library Extensions Test Support",
                    package: "swift-standard-library-extensions"
                ),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Witness Tests",
            dependencies: [
                "Witness",
                "Witness Test Support",
            ]
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
