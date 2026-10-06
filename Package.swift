// swift-tools-version:5.9
// Written by the release workflow of conekta/conekta-elements (deploy.yml, job `deploy-xcframework`): every
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
            url: "https://github.com/conekta/conekta-components-ios/releases/download/1.1.0-beta/composeKit.xcframework.zip",
            checksum: "412a632ca7173b0d0807ab445ca02614eb0a5bfc859f80127f4f2ff5d2545666"
        ),
    ]
)
