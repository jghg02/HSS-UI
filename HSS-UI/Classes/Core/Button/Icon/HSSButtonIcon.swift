//
//  HSSButtonIcon.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation


/**
  Object model that contains the Button Icon representation
 */
@objc public class HSSButtonIcon: NSObject {
    @objc public private(set) var icon: UIImage
    @objc public private(set) var orientation: HSSButtonOrientation

    @objc public init(icon: UIImage, orientation: HSSButtonOrientation) {
        self.icon = icon
        self.orientation = orientation
    }
}

/**
 Represents the orientation of the icon in the Button, the icon can be at the right or left
 */
@objc public enum HSSButtonOrientation: Int, HSSEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: HSSButtonOrientation) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}
