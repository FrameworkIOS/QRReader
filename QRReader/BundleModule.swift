//
//  BundleModule.swift
//  QRReader
//
//  Created by Apple on 14/11/21.
//

import Foundation

#if !SWIFT_PACKAGE
extension Bundle {
    static var module: Bundle = {
        return Bundle(for: QRReaderView.self)
    }()
}


#endif
