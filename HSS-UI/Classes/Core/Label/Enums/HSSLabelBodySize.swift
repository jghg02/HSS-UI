//
//  HSSLabelBodySize.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

@objc public enum HSSLabelBodySize: Int, HSSEnumStringConvertible {
    case bodyL
    case bodyM
    case bodyS
    case bodyXS

    var size: CGFloat {
        switch self {
        case .bodyL:
            return HSSFontSize.bodyL
        case .bodyM:
            return HSSFontSize.bodyM
        case .bodyS:
            return HSSFontSize.bodyS
        case .bodyXS:
            return HSSFontSize.bodyXS
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .bodyL:
            return HSSFontSizeLineHeight.bodyL
        case .bodyM:
            return HSSFontSizeLineHeight.bodyM
        case .bodyS:
            return HSSFontSizeLineHeight.bodyS
        case .bodyXS:
            return HSSFontSizeLineHeight.bodyXS
        }
    }

    public static func keyFor(_ value: HSSLabelBodySize) -> String {
        switch value {
        case .bodyL:
            return "BodyL"
        case .bodyM:
            return "BodyM"
        case .bodyS:
            return "BodyS"
        case .bodyXS:
            return "BodyXS"
        }
    }
}
