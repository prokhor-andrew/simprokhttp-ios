// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "simprokhttp",
    products: [
        
        .library(
            name: "simprokhttp",
            targets: ["simprokhttp"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/simprok-dev/simproktools-ios.git",
            exact: .init(1, 2, 44)
        ),
    ],
    targets: [
        .target(
            name: "simprokhttp",
            dependencies: [
                .product(
                    name: "simproktools",
                    package: "simproktools-ios"
                )
            ]
        ),
    ]
)
