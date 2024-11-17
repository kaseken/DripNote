// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BrewNoteAppModule",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "BrewNoteAppModule",
            targets: ["BrewNoteAppModule"]
        ),
    ],
    targets: [
        .target(
            name: "BrewNoteAppModule"),
        .testTarget(
            name: "BrewNoteAppModuleTests",
            dependencies: ["BrewNoteAppModule"]
        ),
    ]
)
