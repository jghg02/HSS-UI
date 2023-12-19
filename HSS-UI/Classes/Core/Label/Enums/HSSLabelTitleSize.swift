//
//  HSSLabelTitleSize.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation


@objc public enum HSSLabelTitleSize: Int, HSSEnumStringConvertible {
    case titleXL
    case titleL
    case titleM
    case titleS
    case titleXS

    var size: CGFloat {
        switch self {
        case .titleXL:
            return HSSFontSize.titleXL
        case .titleL:
            return HSSFontSize.titleL
        case .titleM:
            return HSSFontSize.titleM
        case .titleS:
            return HSSFontSize.titleS
        case .titleXS:
            return HSSFontSize.titleXS
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .titleXL:
            return HSSFontSizeLineHeight.titleXL
        case .titleL:
            return HSSFontSizeLineHeight.titleL
        case .titleM:
            return HSSFontSizeLineHeight.titleM
        case .titleS:
            return HSSFontSizeLineHeight.titleS
        case .titleXS:
            return HSSFontSizeLineHeight.titleXS
        }
    }

    public static func keyFor(_ value: HSSLabelTitleSize) -> String {
        switch value {
        case .titleXL:
            return "TitleXl"
        case .titleL:
            return "TitleL"
        case .titleM:
            return "TitleM"
        case .titleS:
            return "TitleS"
        case .titleXS:
            return "TitleXS"
        }
    }
}
