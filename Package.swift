// swift-tools-version:5.9
// Written by the release workflow of conekta/conekta-elements (deploy.yml, job `publish-ios`): every
// release X.Y.Z of this repository carries `composeKit.xcframework.zip` and the checksum below points at it.
// Do not edit by hand; the next release overwrites it.
import PackageDescription

let package = Package(
    name: "conekta-components-ios",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "composeKit", targets: ["composeKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "composeKit",
            url: "https://github.com/conekta/conekta-components-ios/releases/download/1.1.0-beta.23/composeKit.xcframework.zip",
            checksum: "bcaef1d52cc6f870b744e6ebd7dc5a2c04ab2384c3e79788a60f2ea35ae6c4b5"
        ),
    ]
)
