//
//  HSSButtonHierarchyFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

class HSSButtonHierarchyFactory {
    static func provideStyle(key: HSSButtonHierarchy) -> HSSButtonHierarchyProtocol {
        switch key {
        case .loud:
            return HSSButtonHierarchyLoud()
        case .quiet:
            return HSSButtonHierarchyQuiet()
        case .transparent:
            return HSSButtonHierarchyTransparent()
        }

    }

}
