//
//  HSSCheckboxAccessibilityManager.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import UIKit


class HSSCheckboxAccessibilityManager: HSSUIAccessibilityManager {
    private weak var view: HSSCheckbox!

    required init(view: UIView) {
        guard let accessibleView = view as? HSSCheckbox else {
            fatalError("HSSCheckboxAccessibilityManager should recieve an HSSCheckbox")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityLabel = "\(checkboxStatusAccessibilityText), \(view.title ?? ""), \(checkboxTypeAccessibilityText), \("Casilla de selección")"
//        view.accessibilityTraits = view.type != .disabled ? .none : .notEnabled
        view.accessibilityHint = checkboxAccessibilityHint
    }

    func accessibilityActivated() {
        view.checkboxTapped()
    }
}

extension HSSCheckboxAccessibilityManager {
    var checkboxStatusAccessibilityText: String {
        switch view.status {
        case .selected:
            return "Marcado"
        case .unselected:
            return "No Marcado"
        case .undefined:
            return "Sin definir"
        }
    }

    var checkboxTypeAccessibilityText: String {
        view.type == .error ? "Error" : ""
    }

    var checkboxAccessibilityHint: String {
        view.type != .disabled ? "Toque dos veces para alternar" : ""
    }
}
