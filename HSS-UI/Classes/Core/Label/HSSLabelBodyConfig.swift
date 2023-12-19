//
//  HSSLabelBodyConfig.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

@objc public class HSSLabelBodyConfig: NSObject {
    let bodySize: HSSLabelBodySize
    public let color: UIColor
    let bodyLinks: HSSBodyLinks?
    let bodyBolds: HSSBodyBolds?
    private(set) var fontStyle: HSSFontStyle
    private(set) var fontStyleBold: HSSFontStyle
    let isLinkColorInverted: Bool

    @objc
    public init(bodySize: HSSLabelBodySize, color: UIColor, bodyLinks: HSSBodyLinks?, bodyBolds: HSSBodyBolds?, isLinkColorInverted: Bool = false) {
        self.bodySize = bodySize
        self.color = color
        self.bodyLinks = bodyLinks
        self.bodyBolds = bodyBolds
        self.isLinkColorInverted = isLinkColorInverted
        self.fontStyle = HSSFontStyle(textColor: color,
                                        font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: bodySize.size),
                                        lineSpacing: 0,
                                        fontLineHeight: bodySize.lineHeight)
        self.fontStyleBold = HSSFontStyle(textColor: color,
                                            font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: bodySize.size),
                                            lineSpacing: 0,
                                            fontLineHeight: bodySize.lineHeight)
        super.init()
    }

    @objc
    public init(bodySize: HSSLabelBodySize, HSSColor: HSSLabelColor, bodyLinks: HSSBodyLinks?, bodyBolds: HSSBodyBolds?, isLinkColorInverted: Bool = false) {
        self.bodySize = bodySize
        self.color = HSSColor.color
        self.bodyLinks = bodyLinks
        self.bodyBolds = bodyBolds
        self.isLinkColorInverted = isLinkColorInverted
        self.fontStyle = HSSFontStyle(textColor: HSSColor.color,
                                        font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: bodySize.size),
                                        lineSpacing: 0,
                                        fontLineHeight: bodySize.lineHeight)
        self.fontStyleBold = HSSFontStyle(textColor: color,
                                            font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: bodySize.size),
                                            lineSpacing: 0,
                                            fontLineHeight: bodySize.lineHeight)
        super.init()
    }

}

