//
//  HSSButtonHierarchyTransparent.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonHierarchyTransparent: HSSButtonHierarchyProtocol {

    public var idleColor: UIColor = .clear

    public var pressedColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor200

    public var focusColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor100

    public var disableColor: UIColor = .clear

    public var fontColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor

    var spinnerTintColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor
}
