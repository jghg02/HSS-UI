//
//  HSSCheckboxAlign.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

/// Used to set the checkbox align
@objc public enum HSSCheckboxAlign: Int, HSSEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: HSSCheckboxAlign) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}

@objc
public enum HSSCheckboxContext: Int, HSSEnumStringConvertible {
    case component, textField

    public static func keyFor(_ value: HSSCheckboxContext) -> String {
        switch value {
        case .component: return "COMPONENT"
        case .textField: return "TEXTFIELD"
        }
    }
}

internal struct HSSCheckboxConstraint {
    let labelToLeadingConstraint: CGFloat
    let labelToTrailingConstraint: CGFloat
}

internal enum HSSCheckboxConstraintFactory {
    static func retrieveConstraints(align: HSSCheckboxAlign, context: HSSCheckboxContext) -> HSSCheckboxConstraint {
        switch context {
        case .component:
            return retrieveComponentConstraints(align: align)
        case .textField:
            return retrieveTextFieldConstraints(align: align)
        }
    }

    private static func retrieveTextFieldConstraints(align: HSSCheckboxAlign) -> HSSCheckboxConstraint {
        switch align {
        case .left:
            return HSSCheckboxConstraintFactory.HSSTextFieldComponentCheckboxLeft
        case .right:
            return HSSCheckboxConstraintFactory.HSSTextFieldComponentCheckboxRight
        }
    }

    private static func retrieveComponentConstraints(align: HSSCheckboxAlign) -> HSSCheckboxConstraint {
        switch align {
        case .left:
            return HSSCheckboxConstraintFactory.defaultPaddingLeft
        case .right:
            return HSSCheckboxConstraintFactory.defaultPaddingRight
        }
    }

    private static var defaultPaddingLeft: HSSCheckboxConstraint {
        HSSCheckboxConstraint(labelToLeadingConstraint: 28.0, labelToTrailingConstraint: 12.0)
    }

    private static var defaultPaddingRight: HSSCheckboxConstraint {
        HSSCheckboxConstraint(labelToLeadingConstraint: 12.0, labelToTrailingConstraint: 28.0)
    }

    private static var HSSTextFieldComponentCheckboxLeft: HSSCheckboxConstraint {
        HSSCheckboxConstraint(labelToLeadingConstraint: 24.0, labelToTrailingConstraint: 12.0)
    }

    private static var HSSTextFieldComponentCheckboxRight: HSSCheckboxConstraint {
        HSSCheckboxConstraint(labelToLeadingConstraint: 12.0, labelToTrailingConstraint: 24.0)
    }
}
