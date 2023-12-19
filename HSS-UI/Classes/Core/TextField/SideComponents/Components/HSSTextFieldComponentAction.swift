//
//  HSSTextFieldComponentAction.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
@objc public class HSSTextFieldComponentAction: NSObject, HSSTextFieldRightComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .always

    @objc public private(set) var label: String

    @objc public init(_ actionLabel: String) {
        label = actionLabel
    }

}
