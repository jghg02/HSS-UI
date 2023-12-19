//
//  HSSButtonViewConfigFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

/**
The responsability of the factory is to provide the ViewConfig from the user specified attributes
*/
internal class HSSButtonViewConfigFactory {

    static func provide(hierarchy: HSSButtonHierarchy, size: HSSButtonSize, text: String, textattributes: [NSAttributedString.Key: Any] = [:], icon: HSSButtonIcon?) -> HSSButtonViewConfig {

        let buttonHierarchy = HSSButtonHierarchyFactory.provideStyle(key: hierarchy)
        let buttonSize = HSSButtonSizeFactory.provideStyle(key: size, icon: icon)
        return provide(hierarchy: buttonHierarchy,
                       size: buttonSize,
                       text: text,
                       textattributes: textattributes,
                       icon: icon)
    }

    static func provide(hierarchy: HSSButtonHierarchyProtocol, size: HSSButtonSizeProtocol, text: String, textattributes: [NSAttributedString.Key: Any] = [:], icon: HSSButtonIcon?) -> HSSButtonViewConfig {

        let viewConfig = HSSButtonViewConfig(backgroundColor: hierarchy.idleColor.cgColor,
                                               pressedColor: hierarchy.pressedColor.cgColor,
                                               disableColor: hierarchy.disableColor.cgColor,
                                               text: text,
                                               textColor: hierarchy.fontColor,
                                               textAttributes: textattributes,
                                               textDisableColor: HSSStyleSheetManager.styleSheet.textColorDisabled,
                                               font: size.font,
                                               cornerRadius: size.borderRadius,
                                               height: size.height,
                                               padding: size.padding,
                                               icon: icon?.icon,
                                               iconColor: hierarchy.fontColor,
                                               iconDisableColor: HSSStyleSheetManager.styleSheet.textColorDisabled,
                                               spinnerTintColor: hierarchy.spinnerTintColor)

        return viewConfig
    }
}
