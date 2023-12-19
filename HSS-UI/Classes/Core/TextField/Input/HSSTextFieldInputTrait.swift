//
//  HSSTextFieldInputTrait.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public enum HSSTextInputTraits: Int, HSSEnumStringConvertible {
    case password
    case email
    case numberPad
    case custom

    public static func keyFor(_ value: HSSTextInputTraits) -> String {
        switch value {
        case .email:
            return "EMAIL"
        case .numberPad:
            return "NUMBER_PAD"
        case .password:
            return "PASSWORD"
        case .custom:
            return "CUSTOM"
        }
    }
}
