// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "CommonComponents",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CommonComponents",
            targets: ["CommonComponents"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/gappzeTalhaBulut/BaseFoundation.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "CommonComponents",
            dependencies: ["BaseFoundation"]
        ),
    ]
)
