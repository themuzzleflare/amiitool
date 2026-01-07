// swift-tools-version:6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "amiitool",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "libamiitool",
            targets: ["libamiitool"]
        ),
        .executable(
            name: "amiitool",
            targets: ["amiitool"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "mbedtls",
            cSettings: [
                .define("MBEDTLS_CONFIG_FILE", to: "\"configs/mbedtls.h\""),
                .unsafeFlags(["-Wall", "-pedantic", "-O2", "-fsigned-char"])
            ]
        ),
        .target(
            name: "libamiitool",
            dependencies: ["mbedtls"]
        ),
        .executableTarget(
            name: "amiitool",
            dependencies: ["libamiitool"]
        )
    ]
)
