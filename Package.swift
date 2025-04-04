// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AwesomeDesignSystem",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "AwesomeDesignSystem",
            targets: ["AwesomeDesignSystem"])
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.3"),
    ],
    targets: [
        .target(
            name: "AwesomeDesignSystem",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm")
            ],
            resources: [
                .process("Resources/Assets.xcassets"),
                .process("Resources/Fonts"),
                .process("Resources/LottieFiles")
            ]
        ),
        .testTarget(
            name: "AwesomeDesignSystemTests",
            dependencies: ["AwesomeDesignSystem"]
        )
    ]
)
