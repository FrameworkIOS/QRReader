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
    func qrReaderView(_ qrReaderView: QRReaderView, didSuccess code: Bool)
    
    func qrReaderView(_ qrReaderView: QRReaderView, didChangeTorchActive isOn: String)
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
    
    public func configure(delegate: QRReaderViewDelegate, input: Input = .default) {
        self.delegate = delegate
        
        if let focusImage = focusImage {
            self.focusImage = focusImage
        }
        
    }
}
