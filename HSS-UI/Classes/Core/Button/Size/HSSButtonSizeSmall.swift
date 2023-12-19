//
//  HSSButtonSizeSmall.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonSizeSmall: HSSButtonSizeProtocol {

    public var font: UIFont = HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 12)

    public var height: CGFloat = 24

    public var borderRadius: CGFloat = 4

    public var padding: CGFloat = 8

//    public var spinnerSize: HSSProgressIndicatorSize = .xSmall

}
