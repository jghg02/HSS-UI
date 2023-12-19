//
//  HSSTextFieldViewConfig.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

/// used to define the ui of internal HSSTextField views
internal struct HSSTextFieldViewConfig {
    var labelText: String?
    var labelStyle: HSSFontStyle = getLabelStyle(HSSStyleSheetManager.styleSheet.textColorPrimary)

    var helperText: String?
    var helperStyle: HSSFontStyle = getHelperTextStyle(HSSStyleSheetManager.styleSheet.textColorSecondary)

    var counter: UInt16 = 0
    var counterStyle: HSSFontStyle = getCounterTextStyle(HSSStyleSheetManager.styleSheet.textColorSecondary)

    var placeholderStyle: HSSFontStyle = getHelperTextStyle(HSSStyleSheetManager.styleSheet.textColorSecondary)
    var placeholderText: String?

    var inputBgColor: UIColor = HSSStyleSheetManager.styleSheet.bgColorPrimary
    var inputTextStyle: HSSFontStyle = getHelperTextStyle(HSSStyleSheetManager.styleSheet.textColorPrimary)

    var textFieldBorderDashed = false
    var editingEnabled: Bool = true

    var textFieldBorderColor: UIColor = HSSStyleSheetManager.styleSheet.bgColorSecondary
    var textFieldBorderWidth: CGFloat = 1
    var textFieldBorderRadious: CGFloat = 6

    var paddings: HSSTextInputPadding = HSSTextInputPadding.defaultPadding

    var helperIcon: String?
    var helperIconColor: UIColor?
    var helperIconBgColor: UIColor?

    var leftViewComponent: HSSTextFieldLeftComponent?
    var leftComponentNeedsReload = true
    var rightViewComponent: HSSTextFieldRightComponent?
    var rightComponentNeedsReload = true

    var textInputTraits: UITextInputTraits?
    var maxLines: UInt16?
    var accessibilityActivated: (() -> Void)?

    var helperLinks: HSSBodyLinks?
    var helperBolds: HSSBodyBolds?

    var isSecureTextEntry = false

    init(labelText: String?,
         helperText: String?,
         helperLinks: HSSBodyLinks?,
         helperBolds: HSSBodyBolds?,
         counter: UInt16,
         placeholderText: String?,
         stateStyle: HSSTextFieldStateProtocol,
         leftViewComponent: HSSTextFieldLeftComponent?,
         rightViewComponent: HSSTextFieldRightComponent?,
         inputTraits: UITextInputTraits?,
         maxLines: UInt16? = nil,
         paddings: HSSTextInputPadding,
         isSecureTextEntry: Bool,
         accessibilityActivated: (() -> Void)?
    ) {

        self.labelText = labelText
        self.helperText = helperText
        self.helperLinks = helperLinks
        self.helperBolds = helperBolds
        self.counter = counter
        self.placeholderText = placeholderText
        self.maxLines = maxLines
        self.paddings = paddings
        self.isSecureTextEntry = isSecureTextEntry

        self.labelStyle = HSSTextFieldViewConfig.getLabelStyle(stateStyle.labelTextColor)
        self.counterStyle = HSSTextFieldViewConfig.getCounterTextStyle(stateStyle.helperColor)
        self.placeholderStyle = HSSTextFieldViewConfig.getInputTextStyle(stateStyle.placeholderTextColor)
        self.inputTextStyle = HSSTextFieldViewConfig.getInputTextStyle(stateStyle.inputTextColor)
        self.inputBgColor = stateStyle.backgroundColor
        self.textFieldBorderColor = stateStyle.borderColor
        self.helperIcon = stateStyle.helperIconName
        self.helperIconColor = stateStyle.helperIconTintColor
        self.helperIconBgColor = stateStyle.helperColor
        self.helperStyle = HSSTextFieldViewConfig.getHelperTextStyle(stateStyle.helperColor, semiBold: stateStyle.helperSemibold)

        self.editingEnabled = stateStyle.editingEnabled
        self.textFieldBorderWidth = stateStyle.borderWidth
        self.textFieldBorderDashed = stateStyle.borderDashed
        self.leftViewComponent = leftViewComponent
        self.rightViewComponent = rightViewComponent

        self.textInputTraits = inputTraits
        self.accessibilityActivated = accessibilityActivated
    }

    init() {

    }

    private static func getLabelStyle(_ color: UIColor) -> HSSFontStyle {
        return HSSFontStyle(textColor: color, font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 14)
    }

    private static func getHelperTextStyle(_ color: UIColor, semiBold: Bool = false) -> HSSFontStyle {
        let font = semiBold ? HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 13) : HSSStyleSheetManager.styleSheet.regularSystemFont(size: 13)

        return HSSFontStyle(textColor: color, font: font, sketchLineHeight: 14)
    }

    internal static func getInputTextStyle(_ color: UIColor) -> HSSFontStyle {
        return HSSFontStyle(textColor: color, font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: 16), sketchLineHeight: 22)
    }

    private static func getCounterTextStyle(_ color: UIColor) -> HSSFontStyle {
        return HSSFontStyle(textColor: color, font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: 13), sketchLineHeight: 14)
    }
}
