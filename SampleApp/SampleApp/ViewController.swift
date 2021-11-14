//
//  ViewController.swift
//  SampleApp
//
//  Created by Apple on 14/11/21.
//

import UIKit
import QRReader

final class ViewController: UIViewController {
    
    @IBOutlet var qrReaderView: QRReaderView! {
        didSet {
            qrReaderView.configure(delegate: self, input: .init(isBlurEffectEnabled: true))
        }
    }
    @IBOutlet var flashButton: FlashButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        qrReaderView.stopRunning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        qrReaderView.startRunning()
    }

    @IBAction func tapFlashButton(_ sender: UIButton) {
        qrReaderView.setTorchActive(isOn: !sender.isSelected)
    }
}

extension ViewController: QRReaderViewDelegate {
    func qrReaderView(_ qrReaderView: QRReaderView, didFailure error: QRReaderErrors) {
        print(error.localizedDescription)
    }

    func qrReaderView(_ qrReaderView: QRReaderView, didSuccess code: String) {
        if let url = URL(string: code), (url.scheme == "http" || url.scheme == "https") {
            openWeb(url: url)
        } else {
            showAlert(code: code)
        }
    }

    func qrReaderView(_ qrReaderView: QRReaderView, didChangeTorchActive isOn: Bool) {
        flashButton.isSelected = isOn
    }
}

private extension ViewController {
    func openWeb(url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: { _ in
            self.qrReaderView.rescan()
        })
    }

    func showAlert(code: String) {
        let alertController = UIAlertController(title: code, message: nil, preferredStyle: .actionSheet)
        let copyAction = UIAlertAction(title: "Copy", style: .default) { [weak self] _ in
            UIPasteboard.general.string = code
            self?.qrReaderView.rescan()
        }
        alertController.addAction(copyAction)
        let searchWebAction = UIAlertAction(title: "Search Web", style: .default) { [weak self] _ in
            UIApplication.shared.open(URL(string: "https://www.google.com/search?q=\(code)")!, options: [:], completionHandler: nil)
            self?.qrReaderView.rescan()
        }
        alertController.addAction(searchWebAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak self] _ in
            self?.qrReaderView.rescan()
        })
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
