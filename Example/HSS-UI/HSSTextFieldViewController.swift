//
//  HSSTextFieldViewController.swift
//  HSS-UI_Example
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import HSS_UI

class HSSTextFieldViewController: UIViewController {

    @IBOutlet weak var textField: HSSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "HSS TextField"

        textField.delegate = self
        textField.leftContent = HSSTextFieldComponentLabel(text: "Prefix")
        textField.rightContent = HSSTextFieldComponentClear()
        textField.placeholder = "Plaecholder"
        textField.helper = "Helper....."
    }
}

extension HSSTextFieldViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String)
          -> Bool {

        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension HSSTextFieldViewController: HSSTextFieldDelegate {
    func hssTextFieldDidChange(_ textField: HSSTextField) {
        print(textField.text)
    }
}
