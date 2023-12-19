//
//  HSSLabelColor.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

@objc public enum HSSLabelColor: Int, HSSEnumStringConvertible {
    case primary
    case secondary
    case disabled
    case negative
    case caution
    case positive
    case link

    public var color: UIColor {
        switch self {
        case .primary:
            return HSSStyleSheetManager.styleSheet.textColorPrimary
        case .secondary:
            return  HSSStyleSheetManager.styleSheet.textColorSecondary
        case .disabled:
            return  HSSStyleSheetManager.styleSheet.textColorDisabled
        case .negative:
            return HSSStyleSheetManager.styleSheet.textColorNegative
        case .caution:
            return HSSStyleSheetManager.styleSheet.textColorCaution
        case .positive:
            return HSSStyleSheetManager.styleSheet.textColorPositive
        case .link:
            return HSSStyleSheetManager.styleSheet.textColorLink
        }

    }

    public static func keyFor(_ value: HSSLabelColor) -> String {
        switch value {
        case .primary:
            return "Primary"
        case .secondary:
            return  "Secondary"
        case .disabled:
            return  "Disabled"
        case .negative:
            return "Negative"
        case .caution:
            return "Caution"
        case .positive:
            return "Positive"
        case .link:
            return "Link"
        }

    }

}
