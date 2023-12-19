//
//  HSSTextInputPadding.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal struct HSSTextInputPadding {
    let top: CGFloat
    let left: CGFloat
    let bottom: CGFloat
    let right: CGFloat

    static var defaultPadding: HSSTextInputPadding {
        return HSSTextInputPadding(top: 13, left: 12, bottom: 13, right: 12)
    }

    static var defaultAreaPadding: HSSTextInputPadding {
        return HSSTextInputPadding(top: 15, left: 7, bottom: 15, right: 7)
    }
}
