//
//  HSSTextFieldStateFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal class HSSTextFieldStateFactory {
    static func getState(_ state: HSSTextInputState, isEditing: Bool) -> HSSTextFieldStateProtocol {
        switch state {
        case .idle:
            return HSSTextFieldStateIdle(focuesd: isEditing)
        case .error:
            return HSSTextFieldStateError(focuesd: isEditing)
        case .disabled:
            return HSSTextFieldStateDisabled()
        case .readOnly:
            return HSSTextFieldStateReadonly()
        case .warning:
            return HSSTextFieldStateWarning(focuesd: isEditing)
        }
    }
}
