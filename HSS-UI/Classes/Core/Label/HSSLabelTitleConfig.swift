//
//  HSSLabelTitleConfig.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

@objc public class HSSLabelTitleConfig: NSObject {
    let titleSize: HSSLabelTitleSize
    public let color: UIColor
    private(set) var fontStyle: HSSFontStyle
    let bodyLinks: HSSBodyLinks?
    let isLinkColorInverted: Bool

    @objc
    public init(titleSize: HSSLabelTitleSize, color: UIColor, bodyLinks: HSSBodyLinks?, isLinkColorInverted: Bool = false) {
        self.titleSize = titleSize
        self.color = color
        self.bodyLinks = bodyLinks
        self.isLinkColorInverted = isLinkColorInverted
        self.fontStyle = HSSFontStyle(textColor: color,
                                        font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: titleSize.size),
                                        lineSpacing: 0,
                                        fontLineHeight: titleSize.lineHeight)
        super.init()
    }

    @objc
    public init(titleSize: HSSLabelTitleSize, HSSColor: HSSLabelColor, bodyLinks: HSSBodyLinks?, isLinkColorInverted: Bool = false) {
        self.titleSize = titleSize
        self.color = HSSColor.color
        self.bodyLinks = bodyLinks
        self.isLinkColorInverted = isLinkColorInverted
        self.fontStyle = HSSFontStyle(textColor: HSSColor.color,
                                        font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: titleSize.size),
                                        lineSpacing: 0,
                                        fontLineHeight: titleSize.lineHeight)
        super.init()
    }
}
