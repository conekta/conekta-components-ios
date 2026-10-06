# Conekta Components for iOS

The iOS distribution of [Conekta Components](https://github.com/conekta/conekta-elements): the native Payment
Component (card, Apple Pay, SPEI, Conekta efectivo, Pago Directo and BNPL) and the card tokenizer, shipped as the
`composeKit.xcframework` binary. This repository holds only the Swift package manifest and the releases; the source
lives in `conekta-elements`, which publishes here on every release.

## Install

Xcode: **File > Add Package Dependencies…**, paste `https://github.com/conekta/conekta-components-ios` and pick the
version you want (**Exact Version** for a prerelease such as `1.1.0-beta`; **Up to Next Major** once a stable one is
out). Or in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/conekta/conekta-components-ios", exact: "1.1.0-beta"),
],
targets: [
    .target(name: "YourApp", dependencies: [.product(name: "composeKit", package: "conekta-components-ios")]),
]
```

Requirements: iOS 15, Xcode 15, Apple-silicon simulators (the Intel simulator slice is not shipped).

## Use

```swift
import composeKit

let session = PaymentSession(config: ComponentsConfig(publicKey: "key_…"))
let controller = PaymentComponentController(session: session)
session.load(orderId: order.id, clientSecret: order.checkout.clientSecret)

// embed the component wherever your checkout lays it out
struct PaymentComponentView: UIViewControllerRepresentable {
    let controller: PaymentComponentController
    func makeUIViewController(context: Context) -> UIViewController {
        PaymentComponentViewControllerKt.PaymentComponentViewController(controller: controller)
    }
    func updateUIViewController(_ vc: UIViewController, context: Context) {}
}

// your own pay button
Button("Pagar") { controller.confirm() }
```

A complete app, built against this package on every release, is `examples/ios-spm` in `conekta-elements`.

## Versions

Each release `X.Y.Z` is the same version as the Android artifacts (`io.conekta.components:*`) and the web SDK
(`conekta-js`); a prerelease (`1.1.0-beta`) is installed by exact version. The XCFramework ships with its privacy
manifest; when a release is code-signed by Conekta, Xcode verifies the signature as it resolves the package.
