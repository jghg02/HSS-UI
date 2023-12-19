//
//  HSSCheckboxType.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public enum HSSCheckboxType: Int, HSSEnumStringConvertible {
    case idle
    case disabled
    case error

    public static func keyFor(_ value: HSSCheckboxType) -> String {
        switch value {
        case .idle: return "IDLE"
        case .disabled: return "DISABLED"
        case .error: return "ERROR"
        }
    }
}
