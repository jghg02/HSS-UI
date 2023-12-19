//
//  HSSTextFieldSideComponentFactory.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import UIKit
internal class HSSTextFieldComponentFactory {
    static func generateLeftComponentView(for config: HSSTextFieldViewConfig, in view: HSSTextFieldView? = nil, visibilities: [HSSTextFieldComponentVisibility]) -> UIView? {
        let leftPadding = config.paddings.left
        guard let visibility = config.leftViewComponent?.visibility, visibilities.contains(visibility) else {
            return TextFieldPaddingView(size: leftPadding)
        }

        switch config.leftViewComponent {
        case let component as HSSTextFieldComponentLabel:
            return HSSTextFieldLabelView(text: component.text, style: component.style, forceLeftPadding: leftPadding)
        case let component as HSSTextFieldComponentIcon:
            return HSSTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case _ as HSSTextFieldEmptySideComponent:
            return UIView(frame: .zero)
        default:
              return TextFieldPaddingView(size: leftPadding)
        }
    }

    static func generateRightComponentView(for config: HSSTextFieldViewConfig, in view: HSSTextFieldView? = nil, visibilities: [HSSTextFieldComponentVisibility]) -> UIView? {
        let rightPadding = config.paddings.right
        guard let visibility = config.rightViewComponent?.visibility, visibilities.contains(visibility) else {
            return TextFieldPaddingView(size: rightPadding)
        }

        switch config.rightViewComponent {
        case let component as HSSTextFieldComponentLabel:
            return HSSTextFieldLabelView(text: component.text, style: component.style, forceRightPadding: rightPadding)
        case let component as HSSTextFieldComponentIcon:
            return HSSTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case let component as HSSTextFieldComponentCheck:
            return HSSTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case let component as HSSTextFieldComponentClear:
             return HSSTextFieldClearView(iconColor: component.iconColor, iconName: component.clearIcon) { [weak view] in
                view?.clear()
            }
        case let component as HSSTextFieldComponentAction:
            return HSSTextFieldActionView(label: component.label) {[weak view] in
                view?.delegate?.didTapRightAction()
            }
        case let component as HSSTextFieldComponentProgressIndicator:
            return HSSTextFieldProgressIndicatorView(progressIndicatorColor: component.tintColor)
        case let component as HSSTextFieldComponentCheckbox:
            return HSSTextFieldCheckboxView(with: component.text, status: component.status, delegate: component.delegate)
        case _ as HSSTextFieldEmptySideComponent:
            return UIView(frame: .zero)
        default:
            return TextFieldPaddingView(size: rightPadding)
        }
    }
}
