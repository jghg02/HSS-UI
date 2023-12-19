//
//  HSSTextFieldDelegate.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
/// Delegation of hssTextField behaviour
@objc public protocol HSSTextFieldDelegate {
    /// Called directly from UITextField ShouldBeginEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldShouldBeginEditing(_ textField: HSSTextField) -> Bool

    /// Called directly from UITextField ShouldEndEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldShouldEndEditing(_ textField: HSSTextField) -> Bool

    /// Called directly from UITextField didBeginEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldDidBeginEditing(_ textField: HSSTextField)

    /// Called directly from UITextField DidEndEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldDidEndEditing(_ textField: HSSTextField)

    /// Called directly from UITextField shouldChangeCharactersIn
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextField(_ textField: HSSTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    /// Called directly from UITextField didChangeSelection
    /// - Parameter textField: the textfield that's triggering the event
    @available(iOS 13, *)
    @objc optional func hssTextFieldDidChangeSelection(_ textField: HSSTextField, selectedRange range: UITextRange?)

    /// Called directly from UITextField didChange action
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldDidChange(_ textField: HSSTextField)

    /// Called on action button touched up
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldDidTapRightAction(_ textField: HSSTextField)

    /// Asks the delegate if the text field should process the pressing of the return button.
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func hssTextFieldShouldReturn(_ textField: HSSTextField) -> Bool

    /// Asks the delegate if the deleteBackward key was pressed.
    /// - Parameter textField: the textfield that's triggering the event
    /// - Parameter wasEmpty: notifies if the textField text was empty before deleteBackward key was pressed.
    @objc optional func hssTextField(_ textField: HSSTextField, didDeleteBackwardAnd wasEmpty: Bool)

    /// Called on checkbox touched up
    /// - Parameter textField: the textfield that's triggering the event
    /// - Parameter status: the component checkbox status
    @objc
    optional func hssTextFieldDidTapRightCheckbox(_ textField: HSSTextField, with status: HSSCheckboxStatus)
}

