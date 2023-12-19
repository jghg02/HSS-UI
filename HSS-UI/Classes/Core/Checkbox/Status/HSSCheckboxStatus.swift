//
//  HSSCheckboxStatus.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
/// Used to set the checkbox status
@objc public enum HSSCheckboxStatus: Int, HSSEnumStringConvertible {
    case selected
    case unselected
    case undefined

    public static func keyFor(_ value: HSSCheckboxStatus) -> String {
        switch value {
        case .selected: return "SELECTED"
        case .unselected: return "UNSELECTED"
        case .undefined: return "UNDEFINED"
        }
    }
}
