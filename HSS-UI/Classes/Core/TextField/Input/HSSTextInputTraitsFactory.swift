//
//  HSSTextInputTraitsFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal class HSSTextInputTraitsFactory: NSObject {
    static func getTraits(for type: HSSTextInputTraits) -> UITextInputTraits? {
        switch type {
        case .password:
            return HSSTextInputTraitsPassword()
        case .email:
            return HSSTextInputTraitsEmail()
        case .numberPad:
            return HSSTextInputTraitsNumberPad()
        case .custom:
            return nil
        }
    }
}

@objc internal class HSSTextInputTraitsEmail: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .emailAddress
    var textContentType: UITextContentType! = .emailAddress
}

@objc internal class HSSTextInputTraitsPassword: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .default
    var isSecureTextEntry: Bool = true
}

@objc internal class HSSTextInputTraitsNumberPad: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .numberPad
}
