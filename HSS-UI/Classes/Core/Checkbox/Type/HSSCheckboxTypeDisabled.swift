//
//  HSSCheckboxTypeDisabled.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

/// Handle checkbox disabled type
class HSSCheckboxTypeDisabled: HSSCheckboxTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = UIColor.HSS.gray250
    var backgroundColor: UIColor = UIColor.HSS.gray100
    var iconColor: UIColor? = UIColor.HSS.gray250
    var cornerRadius: CGFloat = 3

    init() {}

    init(status: HSSCheckboxStatus) {
        let statusProtocol = HSSCheckboxStatusFactory.provide(status)
        if status == .unselected {
            self.backgroundColor = statusProtocol.backgroundColor
            self.borderColor = UIColor.HSS.gray100
            self.borderSize = 2
        }
    }
}
