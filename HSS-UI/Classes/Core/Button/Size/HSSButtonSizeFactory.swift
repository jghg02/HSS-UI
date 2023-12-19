//
//  HSSButtonSizeFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

class HSSButtonSizeFactory {
    static func provideStyle(key: HSSButtonSize, icon: HSSButtonIcon?) -> HSSButtonSizeProtocol {
        switch key {
        case .large:
            return HSSButtonSizeLarge()
        case .medium:
            return HSSButtonSizeMedium()
        case .small:
            return HSSButtonSizeSmall()
        }
    }
}
