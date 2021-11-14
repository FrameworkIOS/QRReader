//
//  QRReaderView.swift
//  QRReader
//
//  Created by Apple on 14/11/21.
//

import UIKit
import AVFoundation

public protocol QRReaderViewDelegate: AnyObject {
    func qrReaderView(_ qrReaderView: QRReaderView, didFailure error: QRReaderErrors)
    func qrReaderView(_ qrReaderView: QRReaderView, didSuccess code: String)
    
    func qrReaderView(_ qrReaderView: QRReaderView, didChangeTorchActive isOn: Bool)
}

public extension QRReaderViewDelegate {
    func qrReaderView(_ qrReaderView: QRReaderView, didChangeTorchActive isOn: Bool) {}
}

@IBDesignable
public class QRReaderView: UIView {
    public struct Input {
        let focusImage: UIImage?
        let focusImagePadding: CGFloat?
        let animationDuraction: Double?
        let isBlurEffectEnabled: Bool?
        
        public static var `default`: Input {
            return .init(focusImage: nil, focusImagePadding: nil, animationDuration: nil, isBlurEffectEnabled: nil)

        }
        
        public init(focusImage: UIImage? = nil, focusImagePadding: CGFloat? = nil, animationDuration: Double? = nil, isBlurEffectEnabled: Bool? = nil)  {
            self.focusImage = focusImage
            self.focusImagePadding = focusImagePadding
            self.animationDuraction = animationDuration
            self.isBlurEffectEnabled = isBlurEffectEnabled
        }
    }
    
    @IBInspectable
    public var focusImage: UIImage?
    
    @IBInspectable
    public var focusImagePadding: CGFloat = 8.0
    
    @IBInspectable
    public var animationDuraction: Double = 0.5
    
    @IBInspectable
    public var isBlurEffectEnabled: Bool = false
    
    public func configure(delegate: QRScannerViewDelegate, input: Input = .default) {
        self.delegate = delegate
        
        if let focusImage = input.focusImage {
            self.focusImage = focusImage
        }
        if let focusImagePadding = input.focusImagePadding {
            self.focusImagePadding = focusImagePadding
        }
        if let animationDuration = input.animationDuration {
            self.animationDuration = animationDuration
        }
        if let isBlurEffectEnabled = input.isBlurEffectEnabled {
            self.isBlurEffectEnabled = isBlurEffectEnabled
        }

        configureSession()
        addPreviewLayer()
        setupBlurEffectView()
        setupImageViews()
    }
    
    public func startRunning() {
        guard isAuthorized() else { return }
        guard !session?.isRunning else { return }
        videoDataOutputEnable = false
        metadataOutputEnable = true
        metadataQueue.async { [weak self] in
            self?.session.startRunning()
        }
    }
    
    
    /* main funcs */
    private func configureSession() {
        
    }
    
    private func setupBlurEffectView() {
        
    }
    
    private func setupImageViews() {
        
    }
    
    private func addPreviewLayer() {
        
    }
    
    // MARK: - Private Functions
    private weak var delegate: QRReaderViewDelegate?

    private enum AuthorizationStatus {
        case authorized, notDetermined, restrictedOrDenied
    }
    
    private func isAuthorized() -> Bool {
        return authorizationStatus == .authorized
    }
    
    private func authorizationStatus() -> AuthorizationStatus {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return .authorized
        case .notDetermined:
            failure(.unauthorized(.notDetermined))
            return .notDetermined
        case .denied:
            failure(.unauthorized(.denied))
            return .restrictedOrDenied
        case .restricted:
            failure(.unauthorized(.restricted))
            return .restrictedOrDenied
        @unknown default:
            return .restrictedOrDenied
        }
    }
}
