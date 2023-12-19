//
//  HSSButtonSize.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

@objc public enum HSSButtonSize: Int, HSSEnumStringConvertible {
    case large
    case medium
    case small

    public static func keyFor(_ value: HSSButtonSize) -> String {
        switch value {
        case .large: return "LARGE"
        case .medium: return "MEDIUM"
        case .small: return "SMALL"
        }
    }
}
