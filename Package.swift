// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xframes-swift",
    targets: [
        .executableTarget(
            name: "xframes-swift",
            linkerSettings: [
                .linkedLibrary("xframesshared"), // Link the library without the "lib" prefix and ".so" extension
                .unsafeFlags(["-L./"])
            ]
        )
    ]
)
