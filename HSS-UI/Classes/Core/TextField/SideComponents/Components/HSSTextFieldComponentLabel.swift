//
//  HSSTextFieldComponentLabel.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public class HSSTextFieldComponentLabel: NSObject, HSSTextFieldLeftComponent, HSSTextFieldRightComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .always

    @objc public let text: String
    public internal(set) var style: HSSFontStyle = HSSTextFieldViewConfig.getInputTextStyle(HSSStyleSheetManager.styleSheet.textColorSecondary)

    @objc public init(text: String) {
        self.text = text
        super.init()
    }
}
