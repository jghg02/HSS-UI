//
//  HSSCheckboxTypeError.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSCheckboxTypeError: HSSCheckboxTypeProtocol {
    var borderColor: UIColor? = UIColor.HSS.red500
    var borderSize: CGFloat? = 2
    var textColor: UIColor = HSSStyleSheetManager.styleSheet.textColorPrimary
    var backgroundColor: UIColor = UIColor.HSS.white
    var iconColor: UIColor?
    var cornerRadius: CGFloat = 3
}
