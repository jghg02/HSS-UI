//
//  HSSCheckboxTypeFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSCheckboxTypeFactory {
    static func provide(_ type: HSSCheckboxType, status: HSSCheckboxStatus) -> HSSCheckboxTypeProtocol {
        switch type {
        case .disabled:
            return HSSCheckboxTypeDisabled(status: status)
        case .idle:
            return HSSCheckboxTypeIdle(status: status)
        case .error:
            return HSSCheckboxTypeError()
        }
    }
}
