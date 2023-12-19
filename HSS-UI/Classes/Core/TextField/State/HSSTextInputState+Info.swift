//
//  HSSTextInputState+Info.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

extension HSSTextInputState {
//    var accessibilityTraits: UIAccessibilityTraits {
//        switch self {
//        case .error, .warning, .idle:
//            return .none
//        case .disabled:
//            return .notEnabled
//        case .readOnly:
//            return .staticText
//        }
//    }

    var accessibilityText: String? {
        switch self {
        case .error:
            return "Error".localized()
        case .warning:
            return "Advertencia".localized()
        default:
            return nil
        }
    }
}
