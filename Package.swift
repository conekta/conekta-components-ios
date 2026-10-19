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
            url: "https://github.com/conekta/conekta-components-ios/releases/download/1.1.0-beta.26/composeKit.xcframework.zip",
            checksum: "384fb1008f2b463595717857005f3e0301b4c0aed13e37009cf392ac350fe22a"
        ),
    ]
)
