//
//  HSSTextFieldEmptySideComponent.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSTextFieldEmptySideComponent: HSSTextFieldRightComponent, HSSTextFieldLeftComponent {
    var visibility: HSSTextFieldComponentVisibility = .whenNotEmpty
    var reloadPolicy: HSSTextFieldComponentReloadPolicy = .onlyOneTime
}
