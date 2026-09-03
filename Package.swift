// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TapMindNGAdapter",
    platforms: [
        .iOS(.v13) // The minimum iOS version your SDK supports
    ],
    products: [
        // This is what users will see when they add the package
        .library(
            name: "TapMindNGAdapter",
            targets: ["TapMindNGAdapterTarget"])
    ],
    dependencies: [
        // Google Mobile Ads official Swift Package
        .package(
            url: "https://github.com/tapmind-tech/TapMind-NG-SDK.git",
            from: "2.0.0"
        )
    ],
    targets: [
        // 1. The actual binary framework
        .binaryTarget(
            name: "TapMindNGAdapterBinary",
            path: "TapMindNGAdapter.xcframework"
        ),
        // 2. The wrapper target that bridges your binary and Google Mobile Ads
        .target(
            name: "TapMindNGAdapterTarget",
            dependencies: [
                .target(name: "TapMindNGAdapterBinary"),
                .product(name: "TapMindNGSDK", package: "TapMindNGSDK")
            ],
            path: "Sources/TapMindNGAdapter" // Points to your physical folder
        )
    ]
)
