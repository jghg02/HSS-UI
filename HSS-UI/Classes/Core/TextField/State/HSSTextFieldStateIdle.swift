//
//  HSSTextFieldStateIdle.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

struct HSSTextFieldStateIdle: HSSTextFieldStateProtocol {
    var borderColor = UIColor.HSS.gray250
    var borderWidth: CGFloat = 1
    var borderDashed = false

    var labelTextColor = HSSStyleSheetManager.styleSheet.textColorPrimary

    var helperColor = HSSStyleSheetManager.styleSheet.textColorSecondary
    var helperIconTintColor: UIColor? = HSSStyleSheetManager.styleSheet.textColorSecondary
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = HSSStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = HSSStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = HSSStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            borderColor = HSSStyleSheetManager.styleSheet.accentColor
            borderWidth = 2
        }
    }
}
