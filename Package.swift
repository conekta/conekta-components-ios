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
            url: "https://github.com/conekta/conekta-components-ios/releases/download/1.1.0-beta.13/composeKit.xcframework.zip",
            checksum: "dd17afeb1112dda8d4424cd56307090068b5fe1e847cf5023b45265e90044021"
        ),
    ]
)
