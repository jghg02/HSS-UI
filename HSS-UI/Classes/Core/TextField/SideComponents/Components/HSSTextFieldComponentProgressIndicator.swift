//
//  HSSTextFieldComponentProgressIndicator.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public class HSSTextFieldComponentProgressIndicator: NSObject, HSSTextFieldRightComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .onlyOneTime

    @objc public private(set) var tintColor: UIColor = .clear

    @objc public convenience init(tintColor: UIColor) {
        self.init()
        self.tintColor = tintColor
    }
}
