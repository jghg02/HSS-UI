//
//  HSSButtonHierarchy.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

@objc public enum HSSButtonHierarchy: Int, HSSEnumStringConvertible {
    case loud
    case quiet
    case transparent

    public static func keyFor(_ value: HSSButtonHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        case .transparent: return "TRANSPARENT"
        }
    }
}
