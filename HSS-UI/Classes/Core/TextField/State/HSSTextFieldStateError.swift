//
//  HSSTextFieldStateError.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

struct HSSTextFieldStateError: HSSTextFieldStateProtocol {
    var borderColor = HSSStyleSheetManager.styleSheet.feedbackColorNegative
    var borderWidth: CGFloat = 1
    var borderDashed: Bool = false

    var labelTextColor = HSSStyleSheetManager.styleSheet.textColorNegative

    var helperColor = HSSStyleSheetManager.styleSheet.textColorNegative
    var helperIconTintColor: UIColor? = HSSStyleSheetManager.styleSheet.textColorWhite
    var helperIconName: String? = "hss_ui_feedback_error_16"
    var helperSemibold: Bool = true

    var backgroundColor = HSSStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = HSSStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = HSSStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            backgroundColor = HSSStyleSheetManager.styleSheet.bgColorWhite
            borderWidth = 2
        }
    }
}
