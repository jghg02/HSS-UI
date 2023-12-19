//
//  HSSButtonSizeMedium.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonSizeMedium: HSSButtonSizeProtocol {

    public var font: UIFont = HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 14)

    public var height: CGFloat = 32

    public var borderRadius: CGFloat = 5

    public var padding: CGFloat = 12

//    var spinnerSize: HSSProgressIndicatorSize = .xSmall

}
