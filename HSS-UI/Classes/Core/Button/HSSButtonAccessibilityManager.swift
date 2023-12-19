//
//  HSSButtonAccessibilityManager.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation
import UIKit

class HSSButtonAccessibilityManager: HSSUIAccessibilityManager {
    private weak var view: HSSButton!

    required init(view: UIView) {
        guard let accessibleView = view as? HSSButton else {
            fatalError("HSSButtonAccessibilityManager should recieve an HSSButton")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
//        view.accessibilityLabel = view.isSpinnerOn ? view.text + "inProgress".localized() : view.text
//        updateViewTraits()
    }

    func accessibilityActivated() {
        if !view.isSpinnerOn && view.isEnabled {
            view.sendActions(for: .touchUpInside)
        }
    }

//    private func updateViewTraits() {
//        if view.isEnabled {
//            view.accessibilityTraits = .button
//        } else {
//            view.accessibilityTraits.formUnion([.button, .notEnabled])
//        }
//    }
}
