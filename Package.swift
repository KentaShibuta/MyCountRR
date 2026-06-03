// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyCountRR",
    platforms: [
        .iOS(.v14), .macOS(.v11)
    ],
    products: [
        .library(
            name: "MyCountRR",
            targets: ["MyCountRRTarget"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/KentaShibuta/MyOpenCV",
            exact: "4.13.0"
        ),
        .package(
            url: "https://github.com/microsoft/onnxruntime-swift-package-manager",
            exact: "1.24.2"
        )
    ],
    targets: [
        .target(
            name: "MyCountRRTarget",
            dependencies: [
                "MyCountRREngineBinary",
                
                // package: の文字列は、リポジトリURLの末尾（リポジトリ名）と完全に一致させます
                .product(name: "opencv2", package: "MyOpenCV"),
                .product(name: "onnxruntime", package: "onnxruntime-swift-package-manager")
            ],
            path: "Sources/MyCountRRTarget"
        ),
        .binaryTarget(
            name: "MyCountRREngineBinary",
            url: "https://github.com/KentaShibuta/MyCountRR/releases/download/1.0.0/engine.xcframework.zip",
            checksum: "f93d19c5adada37480effd96adcc3296fa6205e9db487d40927ea26a9419c9df"
        ),
    ]
)
