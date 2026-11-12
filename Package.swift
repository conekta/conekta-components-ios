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
            url: "https://github.com/conekta/conekta-components-ios/releases/download/1.2.0/composeKit.xcframework.zip",
            checksum: "f62bca5eaf8aff1e476ccffdd5cc6bb5333ed68b1577887202355b87868c4895"
        ),
    ]
)
