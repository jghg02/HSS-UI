//
//  HSSTextFieldStateProtocol.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal protocol HSSTextFieldStateProtocol {
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }
    var borderDashed: Bool { get }

    var labelTextColor: UIColor { get }

    var helperColor: UIColor { get }
    var helperIconTintColor: UIColor? { get }
    var helperIconName: String? { get }
    var helperSemibold: Bool { get }

    var backgroundColor: UIColor { get }
    var inputTextColor: UIColor { get }
    var editingEnabled: Bool { get }

    var placeholderTextColor: UIColor { get }
}
