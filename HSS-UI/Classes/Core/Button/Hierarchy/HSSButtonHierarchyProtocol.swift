//
//  HSSButtonHierarchyProtocol.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal protocol HSSButtonHierarchyProtocol {

    var idleColor: UIColor { get }
    var pressedColor: UIColor { get }
    var disableColor: UIColor { get }

    var fontColor: UIColor { get }

    var spinnerTintColor: UIColor { get }
}
