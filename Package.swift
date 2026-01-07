// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationKit",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "FoundationKit",
            targets: ["FoundationKit"]),
    ],
    targets: [
        .target(
            name: "FoundationKit"),
        .testTarget(
            name: "FoundationKitTests",
            dependencies: ["FoundationKit"]
        ),
    ]
)
