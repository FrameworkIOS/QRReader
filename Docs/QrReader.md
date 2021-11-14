## How to use this framework??

- here the guide

## Basic:
```swift
import QRReader

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let qrReaderView = QRReaderView(frame: view.bounds)
        view.addSubview(qrReaderView)
        qrReaderView.configure(delegate: self)
        qrReaderView.startRunning()
    }
}

extension ViewController: QRReaderViewDelegate {
    func qrReaderView(_ qrReaderView: QRReaderView, didFailure error: QRReaderError) {
        print(error)
    }

    func qrReaderView(_ qrReaderView: QRReaderView, didSuccess code: String) {
        print(code)
    }
}

```

- Flash Button
```swift
final class ViewController: UIViewController {

    ...

    @IBOutlet var flashButton: FlashButton!

    @IBAction func tapFlashButton(_ sender: UIButton) {
        qrReaderView.setTorchActive(isOn: !sender.isSelected)
    }
}

extension ViewController: QRReaderViewDelegate {

    ...

    func qrReaderView(_ qrReaderView: QRReaderView, didChangeTorchActive isOn: Bool) {
        flashButton.isSelected = isOn
    }
}

```

- Blur Effect:
```swift
     qrReaderView.configure(delegate: self, input: .init(isBlurEffectEnabled: true))

```

- Advance:
```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let qrReaderView = QRReaderView(frame: view.bounds)

    qrReaderView.focusImage = UIImage(named: "scan_qr_focus")
    qrReaderView.focusImagePadding = 8.0
    qrReaderView.animationDuration = 0.5

    qrReaderView.configure(delegate: self)
    view.addSubview(qrReaderView)
    qrReaderView.startRunning()
}

```