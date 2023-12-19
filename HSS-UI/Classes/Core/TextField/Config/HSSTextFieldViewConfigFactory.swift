//
//  HSSTextFieldViewConfigFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
internal class HSSTextFieldViewConfigFactory {
    static func provideInternalConfig(from textField: HSSTextField) -> HSSTextFieldViewConfig {

        let stateStyle = HSSTextFieldStateFactory.getState(textField.state, isEditing: textField.isEditing)
        let paddings = HSSTextInputPaddingFactory.providePaddingForField(state: textField.state)

        let config = HSSTextFieldViewConfig(labelText: textField.label,
                                              helperText: textField.helper,
                                              helperLinks: textField.helperLinks,
                                              helperBolds: textField.helperBolds,
                                              counter: textField.counter,
                                              placeholderText: textField.placeholder,
                                              stateStyle: stateStyle,
                                              leftViewComponent: textField.leftContent,
                                              rightViewComponent: textField.rightContent,
                                              inputTraits: textField.inputTraits,
                                              paddings: paddings,
                                              isSecureTextEntry: textField.isSecureTextEntry,
                                              accessibilityActivated: textField.accessibilityManager?.accessibilityActivated)
        return config
    }

    static func provideInternalConfig(from textArea: HSSTextArea) -> HSSTextFieldViewConfig {

        let stateStyle = HSSTextFieldStateFactory.getState(textArea.state, isEditing: textArea.isEditing)
        let paddings = HSSTextInputPaddingFactory.providePaddingForArea(state: textArea.state)

        let config = HSSTextFieldViewConfig(labelText: textArea.label,
                                              helperText: textArea.helper,
                                              helperLinks: textArea.helperLinks,
                                              helperBolds: textArea.helperBolds,
                                              counter: textArea.counter,
                                              placeholderText: textArea.placeholder,
                                              stateStyle: stateStyle,
                                              leftViewComponent: nil,
                                              rightViewComponent: nil,
                                              inputTraits: textArea.inputTraits,
                                              maxLines: textArea.maxLines,
                                              paddings: paddings,
                                              isSecureTextEntry: false,
                                              accessibilityActivated: nil)

        return config
    }
}
