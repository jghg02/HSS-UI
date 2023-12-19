//
//  HSSTextFieldComponentClear.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public class HSSTextFieldComponentClear: NSObject, HSSTextFieldRightComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .whenNotEmpty
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .always

    let clearIcon = HSSIcons.close16
    let iconColor = HSSStyleSheetManager.styleSheet.textColorSecondary
}

