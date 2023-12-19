//
//  HSSCheckboxView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal protocol HSSCheckboxView: UIView {
    // expose behaviour to HSSCheckbox common to all HSS Views
    var delegate: HSSCheckboxViewDelegate? { get set }
    func update(withConfig config: HSSCheckboxViewConfig)

}
