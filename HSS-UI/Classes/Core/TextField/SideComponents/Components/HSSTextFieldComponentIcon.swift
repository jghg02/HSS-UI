//
//  HSSTextFieldComponentIcon.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public class HSSTextFieldComponentIcon: NSObject, HSSTextFieldRightComponent, HSSTextFieldLeftComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = .clear

    @objc public convenience init(hssIconName: String, tintColor: UIColor) {
        self.init()
        HSSIconsProvider.loadIcon(name: hssIconName, success: { self.icon = $0 })
        self.tintColor = tintColor
    }

    @objc public convenience init(icon: UIImage, tintColor: UIColor) {
        self.init()
        self.icon = icon
        self.tintColor = tintColor
    }
}

