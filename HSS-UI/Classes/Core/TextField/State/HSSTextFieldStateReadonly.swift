//
//  HSSTextFieldStateReadonly.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

struct HSSTextFieldStateReadonly: HSSTextFieldStateProtocol {
    var borderColor = UIColor.clear
    var borderWidth: CGFloat = 0
    var borderDashed: Bool = false

    var labelTextColor = HSSStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = UIColor.clear
    var helperIconTintColor: UIColor?
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = UIColor.clear
    var inputTextColor = HSSStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = false
    var placeholderTextColor = HSSStyleSheetManager.styleSheet.textColorPrimary
}
