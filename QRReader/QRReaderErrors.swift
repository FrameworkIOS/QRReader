//
//  QRReaderErrors.swift
//  QRReader
//
//  Created by Apple on 14/11/21.
//

/* imports */
import Foundation
import AVFoundation

public enum QRReaderErrors: Error {
    case unauthorized(AVAuthorizationStatus)
    case deviceFailure(DeviceError)
    case readFailure
    case unknown

    public enum DeviceError {
        case videoUnavailable
        case inputInvalid
        case metadataOutputFailure
        case videoDataOutputFailure
    }
}
