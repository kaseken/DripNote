// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DripNoteAppModule",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "DripNoteAppModule",
            targets: ["DripNoteAppModule"]
        ),
    ],
    targets: [
        .target(
            name: "DripNoteAppModule",
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "DripNoteAppModuleTests",
            dependencies: ["DripNoteAppModule"]
        ),
    ]
)
