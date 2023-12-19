//
//  TextField.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

// Internal class created so as to handle deleteBackward action
final class TextField: UITextField {
    override func deleteBackward() {
        let wasEmpty = text?.isEmpty ?? true
        super.deleteBackward()
        (delegate as? TextFieldDelegate)?.textField(self, didDeleteBackwardAnd: wasEmpty)
    }
}

protocol TextFieldDelegate: UITextFieldDelegate {
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool)
}
