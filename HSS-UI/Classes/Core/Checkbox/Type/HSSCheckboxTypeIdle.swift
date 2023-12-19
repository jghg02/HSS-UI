//
//  HSSCheckboxTypeIdle.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSCheckboxTypeIdle: HSSCheckboxTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = HSSStyleSheetManager.styleSheet.textColorPrimary
    var backgroundColor: UIColor = UIColor.HSS.white
    var iconColor: UIColor? = UIColor.HSS.white
    var cornerRadius: CGFloat = 3

    init() {

    }

    init(status: HSSCheckboxStatus) {
        let statusProtocol = HSSCheckboxStatusFactory.provide(status)
        self.backgroundColor = statusProtocol.backgroundColor
        if status == HSSCheckboxStatus.unselected {
            self.borderColor = UIColor.HSS.gray250
            self.borderSize = 2
        }
    }
}
