//
//  QRReaderView.swift
//  QRReader
//
//  Created by Apple on 14/11/21.
//

import UIKit
import AVFoundation

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
    
    
}
