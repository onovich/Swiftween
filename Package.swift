// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Swiftween",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Swiftween",
            targets: ["Swiftween"]
        ),
    ],
    targets: [
        .target(
            name: "Swiftween",
            path: "Sources/Swiftween"
        ),
        .testTarget(
            name: "SwiftweenTests",
            dependencies: ["Swiftween"],
            path: "Tests/SwiftweenTests"
        ),
    ]
)
