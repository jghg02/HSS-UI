//
//  HSSCheckboxStatusFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSCheckboxStatusFactory {
    static func provide(_ type: HSSCheckboxStatus) -> HSSCheckboxStatusProtocol {
        switch type {
        case .selected:
            return HSSCheckboxStatusSelected()
        case .undefined:
            return HSSCheckboxStatusUndefined()
        case .unselected:
            return HSSCheckboxStatusUnselected()
        }
    }
}
