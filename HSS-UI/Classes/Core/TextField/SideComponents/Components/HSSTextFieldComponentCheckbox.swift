//
//  HSSTextFieldComponentCheckbox.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc
public class HSSTextFieldComponentCheckbox: NSObject, HSSTextFieldRightComponent {
    public private(set) var visibility: HSSTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: HSSTextFieldComponentReloadPolicy = .onlyOneTime

    @objc public private(set) var text: String?
    @objc public private(set) var status: HSSCheckboxStatus
    @objc public private(set) weak var delegate: HSSTextField?

    @objc
    public init(with text: String? = nil, status: HSSCheckboxStatus, delegate: HSSTextField) {
        self.delegate = delegate
        self.text = text
        self.status = status
    }

    @objc
    public convenience init(with text: String? = nil, delegate: HSSTextField) {
        self.init(with: text, status: .unselected, delegate: delegate)
    }
}
