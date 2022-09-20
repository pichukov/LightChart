// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LightChart",
    platforms: [
        .iOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "LightChart",
            targets: ["LightChart"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LightChart",
            dependencies: []),
        .testTarget(
            name: "LightChartTests",
            dependencies: ["LightChart"]),
    ]
)
