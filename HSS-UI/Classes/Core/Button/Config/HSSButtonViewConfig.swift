//
//  HSSButtonViewConfig.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal struct HSSButtonViewConfig {
    var backgroundColor: CGColor
    var pressedColor: CGColor
    var disableColor: CGColor

    var text: String
    var textColor: UIColor
    var textAttributes: [NSAttributedString.Key: Any]
    var textDisableColor: UIColor
    var font: UIFont

    var cornerRadius: CGFloat
    var height: CGFloat
    var padding: CGFloat

    var icon: UIImage?
    var iconColor: UIColor?
    var iconDisableColor: UIColor?

    var spinnerTintColor: UIColor
//    var spinnerSize: AndesProgressIndicatorSize
}
