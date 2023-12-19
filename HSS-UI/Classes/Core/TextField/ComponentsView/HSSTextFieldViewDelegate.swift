//
//  HSSTextFieldViewDelegate.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal protocol HSSTextFieldViewDelegate: AnyObject {
    func didBeginEditing()
    func didEndEditing(text: String)
    func shouldBeginEditing() -> Bool
    func shouldEndEditing() -> Bool
    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func didChangeSelection(selectedRange range: UITextRange?)
    func didChange()
    func didTapRightAction()
    func shouldReturn() -> Bool
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool)
}

extension HSSTextFieldViewDelegate { // optional (implemented only on textfield or text area only)
    func didTapRightAction() {}
    func shouldReturn() -> Bool {return true}
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool) {}
}
