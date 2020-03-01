// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EscapeFromFlavortown",
    products: [
        .library(
            name: "EscapeFromFlavortown",
            targets: ["EscapeFromFlavortown"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "EscapeFromFlavortown",
            dependencies: []),
        .testTarget(
            name: "EscapeFromFlavortownTests",
            dependencies: ["EscapeFromFlavortown"]),
    ]
)
