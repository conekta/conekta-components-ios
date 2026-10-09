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
    .package(url: "https://github.com/conekta/conekta-components-ios", exact: "1.1.0-beta.22"),
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

// options and appearance: a no-argument constructor and one `with…` setter per option (Swift cannot name Kotlin's
// default arguments); colors are CSS hex, sizes dp, the method order the same values the web option takes
let options = PaymentComponentOptions()
    .withBusinessName(businessName: "Tienda Demo")
    .withLayout(layout: ComponentLayout.companion.of(kind: .tabs).withColumns(columns: 3))
    .withPaymentMethodOrder(paymentMethodOrder: PaymentMethodOrder.companion.listed(values: ["card", "creditea_bnpl"]))
let appearance = ComponentAppearance()
    .withColorPrimary(hex: "#2C4CF5")
    .withBorderRadius(dp: 12)

// embed the component wherever your checkout lays it out: it does not scroll by itself, it publishes the height
// its content needs as the view controller's `preferredContentSize`, so give it that height inside your scroll view
struct PaymentComponentView: UIViewControllerRepresentable {
    let controller: PaymentComponentController
    let options: PaymentComponentOptions
    let appearance: ComponentAppearance
    @Binding var height: CGFloat

    func makeCoordinator() -> Coordinator { Coordinator(height: $height) }

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = PaymentComponentViewControllerKt.PaymentComponentViewController(
            controller: controller, options: options, appearance: appearance   // read once: give the view a new .id() to change them
        )
        context.coordinator.follow(vc)
        return vc
    }
    func updateUIViewController(_ vc: UIViewController, context: Context) {}

    final class Coordinator {
        let height: Binding<CGFloat>
        var observation: NSKeyValueObservation?
        init(height: Binding<CGFloat>) { self.height = height }
        func follow(_ vc: UIViewController) {
            observation = vc.observe(\.preferredContentSize, options: [.initial, .new]) { [height] vc, _ in
                DispatchQueue.main.async { height.wrappedValue = vc.preferredContentSize.height }
            }
        }
    }
}

// in your checkout
@State private var componentHeight: CGFloat = 0
ScrollView {
    PaymentComponentView(controller: controller, options: options, appearance: appearance, height: $componentHeight)
        .frame(height: max(componentHeight, 1))
    Button("Pagar") { controller.confirm() }   // your own pay button
}
```

A complete app, built against this package on every release, is `examples/ios-spm` in `conekta-elements`.

## Versions

Each release `X.Y.Z` is the same version as the Android artifacts (`io.conekta.components:*`) and the web SDK
(`conekta-components`); a prerelease (`1.1.0-beta`) is installed by exact version. The XCFramework ships with its privacy
manifest; when a release is code-signed by Conekta, Xcode verifies the signature as it resolves the package.
