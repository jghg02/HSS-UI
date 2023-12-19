//
//  HSSTextFieldComponentVisibility.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//


@objc public enum HSSTextFieldComponentVisibility: Int, HSSEnumStringConvertible {
    case always
    case whenNotEmpty

    public static func keyFor(_ value: HSSTextFieldComponentVisibility) -> String {
        switch value {
        case .always: return "ALWAYS"
        case .whenNotEmpty: return "WHENNOTEMPTY"
        }
    }
}
