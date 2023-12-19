//
//  HSSLabelInternalConfig.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

internal class HSSLabelInternalConfig: NSObject {
    public let size: CGFloat
    public let lineHeight: CGFloat
    let color: UIColor
    let bodyLinks: HSSBodyLinks?
    let bodyBolds: HSSBodyBolds?
    private(set) var fontStyle: HSSFontStyle
    private(set) var fontStyleBold: HSSFontStyle
    let isLinkColorInverted: Bool

    @objc
    public init(size: CGFloat, lineHeight: CGFloat, color: UIColor, bodyLinks: HSSBodyLinks?, bodyBolds: HSSBodyBolds?, isLinkColorInverted: Bool = false) {
        self.size = size
        self.lineHeight = lineHeight
        self.color = color
        self.bodyLinks = bodyLinks
        self.bodyBolds = bodyBolds
        self.isLinkColorInverted = isLinkColorInverted
        self.fontStyle = HSSFontStyle(textColor: color,
                                        font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: self.size),
                                        lineSpacing: 0,
                                        fontLineHeight: self.lineHeight)
        self.fontStyleBold = HSSFontStyle(textColor: color,
                                            font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: self.size),
                                            lineSpacing: 0,
                                            fontLineHeight: self.lineHeight)
        super.init()
    }

    @objc
    public init(size: CGFloat, lineHeight: CGFloat, HSSColor: HSSLabelColor, bodyLinks: HSSBodyLinks?, bodyBolds: HSSBodyBolds?, isLinkColorInverted: Bool = false) {
        self.size = size
        self.lineHeight = lineHeight
        self.color = HSSColor.color
        self.bodyLinks = bodyLinks
        self.bodyBolds = bodyBolds
        self.isLinkColorInverted = isLinkColorInverted
        self.fontStyle = HSSFontStyle(textColor: HSSColor.color,
                                        font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: self.size),
                                        lineSpacing: 0,
                                        fontLineHeight: self.lineHeight)
        self.fontStyleBold = HSSFontStyle(textColor: color,
                                            font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: self.size),
                                            lineSpacing: 0,
                                            fontLineHeight: self.lineHeight)
        super.init()
    }

}

