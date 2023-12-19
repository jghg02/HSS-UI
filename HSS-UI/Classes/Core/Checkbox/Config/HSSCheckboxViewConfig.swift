//
//  HSSCheckboxViewConfig.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

/// used to define the ui of internal HSSCheckbox views
internal struct HSSCheckboxViewConfig {

    var title: String?
    var titleNumberOfLines: Int = 1
    var icon: String?
    var borderColor: UIColor?
    var textColor: UIColor!
    var iconColor: UIColor?
    var align: HSSCheckboxAlign = HSSCheckboxAlign.left
    var context: HSSCheckboxContext = .component
    var backgroundColor: UIColor = UIColor.HSS.white
    var cornerRadius: CGFloat = 3
    var borderSize: CGFloat?
    var type: HSSCheckboxTypeProtocol! = HSSCheckboxTypeIdle()
    var status: HSSCheckboxStatusProtocol! = HSSCheckboxStatusUnselected()

    init () { }

    init(for checkbox: HSSCheckbox) {
        self.title = checkbox.title
        self.align = checkbox.align
        self.status = HSSCheckboxStatusFactory.provide(checkbox.status)
        self.icon = status.icon
        self.type = HSSCheckboxTypeFactory.provide(checkbox.type, status: checkbox.status)
        self.textColor = type.textColor
        self.cornerRadius = type.cornerRadius
        self.iconColor = self.type.iconColor
        self.borderColor = type.borderColor
        self.borderSize = type.borderSize
        self.backgroundColor = type.backgroundColor
        self.titleNumberOfLines = checkbox.titleNumberOfLines
        self.context = checkbox.context
    }
}

