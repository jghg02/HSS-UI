//
//  HSSTextFieldRightComponent.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

/// Component that can be placed on the right side of an HSSTextField
@objc public protocol HSSTextFieldRightComponent {
    var visibility: HSSTextFieldComponentVisibility { get }
    var reloadPolicy: HSSTextFieldComponentReloadPolicy { get }
}
