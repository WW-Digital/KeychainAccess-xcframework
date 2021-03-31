// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "KeychainAccess-xcframework",
    platforms: [
        .iOS(.v8),
        .watchOS(.v3),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "KeychainAccess",
            targets: ["KeychainAccess"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "KeychainAccess",
            url: "https://github.com/WW-Digital/ios-KeychainAccess/releases/download/4.2.1/KeychainAccess.xcframework.zip",
            checksum: "2e1505dde90b669058dea6d8ece62d83e50fe51faeaa7f9dd21398a817061b86"
        ),
    ]
)
