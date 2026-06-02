// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyCountRR",
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
            name: "onnxruntime-swift-package-manager", // 💡 名前を明示的に固定
            url: "https://github.com/microsoft/onnxruntime-swift-package-manager",
            exact: "1.24.2"
        )
    ],
    targets: [
        .target(
            name: "MyCountRRTarget",
            dependencies: [
                "MyCountRREngineBinary",
                .product(name: "MyOpenCV", package: "MyOpenCV"),
                .product(name: "OnnxRuntime", package: "onnxruntime-swift-package-manager")
            ],
            path: "Sources/MyCountRRTarget"
        ),
        .binaryTarget(
            name: "MyCountRREngineBinary",
            url: "https://github.com/KentaShibuta/MyCountRR/releases/download/1.0.0/engine.xcframework.zip", // .zip必須
            checksum: "f93d19c5adada37480effd96adcc3296fa6205e9db487d40927ea26a9419c9df"
        ),
    ]
)
