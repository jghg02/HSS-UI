//
//  HSSTextFieldComponentReloadPolicy.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public enum HSSTextFieldComponentReloadPolicy: Int, HSSEnumStringConvertible {
    case always
    case onlyOneTime

    public static func keyFor(_ value: HSSTextFieldComponentReloadPolicy) -> String {
        switch value {
        case .always: return "ALWAYS"
        case .onlyOneTime: return "ONLYONETIME"
        }
    }
}
