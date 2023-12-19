//
//  HSSTextFieldState.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public enum HSSTextInputState: Int, HSSEnumStringConvertible {
    case idle
    case error
    case disabled
    case readOnly
    case warning

    public static func keyFor(_ value: HSSTextInputState) -> String {
        switch value {
        case .idle: return "IDLE"
        case .error: return "ERROR"
        case .readOnly: return "READONLY"
        case .disabled: return "DISABLED"
        case .warning: return "WARNING"
        }
    }
}
