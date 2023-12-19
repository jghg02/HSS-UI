//
//  HSSTextFieldView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation


internal protocol HSSTextFieldView: UIView {
    // expose behaviour to HSSMessage common to all Message Views
    var delegate: HSSTextFieldViewDelegate? { get set }

    var text: String { get set } // input text
    var attributeText: NSAttributedString? { get set }
    var config: HSSTextFieldViewConfig { get }
    var textInputView: UIView { get }
    var customInputView: UIView? {get set}
    var innerTextField: UITextField? { get }
    var customInputAccessoryView: UIView? { get set }
    func update(withConfig config: HSSTextFieldViewConfig)
    func clear()
}
