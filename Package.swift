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
        // 💡 パッケージ名を明示的に指定して、大文字・小文字のブレによるエラーを完全に防ぎます
        .package(
            name: "MyOpenCV",
            url: "https://github.com/KentaShibuta/MyOpenCV",
            exact: "4.13.0"
        ),
        .package(
            name: "onnxruntime-swift-package-manager",
            url: "https://github.com/microsoft/onnxruntime-swift-package-manager",
            exact: "1.24.2"
        )
    ],
    targets: [
        .target(
            name: "MyCountRRTarget",
            dependencies: [
                "MyCountRREngineBinary", // あなたの自作 xcframework
                
                // 💡 外部プロダクトとの紐付け
                // package名には、上の「name:」で指定した文字列を寸分違わず一致させます
                .product(name: "MyOpenCV", package: "MyOpenCV"),
                
                // 💡 microsoft公式の定義に合わせて、name（プロダクト名）を「onnxruntime」に修正します
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
