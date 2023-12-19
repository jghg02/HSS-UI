//
//  HSSCheckboxTypeProtocol.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

internal protocol HSSCheckboxTypeProtocol {
    var borderColor: UIColor? { get }
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var iconColor: UIColor? { get }
    var cornerRadius: CGFloat { get }
    var borderSize: CGFloat? { get }
}
