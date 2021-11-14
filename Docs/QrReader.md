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