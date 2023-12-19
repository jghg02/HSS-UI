//
//  HSSButtonSizeLarge.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonSizeLarge: HSSButtonSizeProtocol {

    public init(buttonIcon: HSSButtonIcon? = nil) {
        self.padding = buttonIcon == nil ? 24 : 16
    }

    public var font: UIFont = HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16)

    public var height: CGFloat = 48

    public var borderRadius: CGFloat = 6

    public var padding: CGFloat

//    public var spinnerSize: HSSProgressIndicatorSize = .small

}
