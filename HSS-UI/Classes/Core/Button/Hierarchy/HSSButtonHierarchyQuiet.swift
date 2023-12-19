//
//  HSSButtonHierarchyQuiet.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonHierarchyQuiet: HSSButtonHierarchyProtocol {

    public var idleColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor150

    public var pressedColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor300

    public var focusColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor200

    public var disableColor: UIColor = UIColor.HSS.gray100

    public var fontColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor

    var spinnerTintColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor
}
