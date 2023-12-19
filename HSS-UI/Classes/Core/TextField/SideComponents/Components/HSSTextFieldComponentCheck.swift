//
//  HSSTextFieldComponentCheck.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public class HSSTextFieldComponentCheck: NSObject, HSSTextFieldRightComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = HSSStyleSheetManager.styleSheet.feedbackColorPositive

    public override init() {
        super.init()
        HSSIconsProvider.loadIcon(name: HSSIcons.feedbackSuccess16) { self.icon = $0 }
    }
}
