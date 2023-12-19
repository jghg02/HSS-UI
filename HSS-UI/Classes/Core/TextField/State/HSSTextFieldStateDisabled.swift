//
//  HSSTextFieldStateDisabled.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

struct HSSTextFieldStateDisabled: HSSTextFieldStateProtocol {
    var borderColor = HSSStyleSheetManager.styleSheet.textColorDisabled
    var borderWidth: CGFloat = 1
    var borderDashed = true

    var labelTextColor = HSSStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = HSSStyleSheetManager.styleSheet.textColorDisabled
    var helperIconTintColor: UIColor?
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = UIColor.HSS.gray040
    var inputTextColor: UIColor = HSSStyleSheetManager.styleSheet.textColorDisabled
    var editingEnabled = false

    var placeholderTextColor = HSSStyleSheetManager.styleSheet.textColorSecondary
}
