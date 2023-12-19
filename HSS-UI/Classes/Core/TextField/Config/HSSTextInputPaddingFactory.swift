//
//  HSSTextInputPaddingFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSTextInputPaddingFactory {
    static func providePaddingForField(state: HSSTextInputState) -> HSSTextInputPadding {
        switch state {
        case .readOnly:
            return HSSTextInputPadding(top: 13, left: 4, bottom: 13, right: 4)
        default:
            return HSSTextInputPadding.defaultPadding
        }
    }

    static func providePaddingForArea(state: HSSTextInputState) -> HSSTextInputPadding {
        switch state {
        case .readOnly:
            return HSSTextInputPadding(top: 15, left: 0, bottom: 15, right: 0)
        default:
            return HSSTextInputPadding.defaultAreaPadding
        }
    }
}
