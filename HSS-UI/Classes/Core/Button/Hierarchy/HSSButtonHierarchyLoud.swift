//
//  HSSButtonHierarchyLoud.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonHierarchyLoud: HSSButtonHierarchyProtocol {

    public var idleColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor

    public var pressedColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor700

    public var focusColor: UIColor = HSSStyleSheetManager.styleSheet.accentColor

    public var disableColor: UIColor = UIColor.HSS.gray100

    public var fontColor: UIColor = HSSStyleSheetManager.styleSheet.textColorWhite

    var spinnerTintColor: UIColor = HSSStyleSheetManager.styleSheet.textColorWhite

}
