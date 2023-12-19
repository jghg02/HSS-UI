//
//  HSSFontStyle.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

@objc public class HSSFontStyle: NSObject {
    @objc public private(set) var textColor: UIColor
    @objc public private(set) var font: UIFont
    @objc public private(set) var lineSpacing: CGFloat
    @objc public private(set) var fontLineHeight: CGFloat = 0

    @available(*, deprecated, renamed: "lineSpacing")
    @objc
    public private(set) var lineHeight: CGFloat {
        get {
            return lineSpacing
        }
        set {
            lineSpacing = newValue
        }
    }

    @available(*, deprecated, message: "Please use init with init(textColor:font:lineSpacing:)' instead")
    @objc
    public init(textColor: UIColor, font: UIFont, lineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = lineHeight
    }

    @objc
    public init(textColor: UIColor, font: UIFont, lineSpacing: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = lineSpacing
    }

    @objc
    public init(textColor: UIColor, font: UIFont, lineSpacing: CGFloat, fontLineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = lineSpacing
        self.fontLineHeight = fontLineHeight
    }

    /// Init an HSSFontStyle with a sketch line height
    /// - Parameters:
    ///   - textColor: Font Color
    ///   - font: font (with sketch size)
    ///   - sketchLineHeight: line height
    @objc
    public init(textColor: UIColor, font: UIFont, sketchLineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = sketchLineHeight - font.lineHeight
    }
}

@objc
public class HSSFontSize: NSObject {
    @objc public static let titleXL: CGFloat = 32
    @objc public static let titleL: CGFloat = 28
    @objc public static let titleM: CGFloat = 24
    @objc public static let titleS: CGFloat = 20
    @objc public static let titleXS: CGFloat = 18

    @objc public static let bodyL: CGFloat = 18
    @objc public static let bodyM: CGFloat = 16
    @objc public static let bodyS: CGFloat = 14
    @objc public static let bodyXS: CGFloat = 12
}

@objc
public class HSSFontSizeLineHeight: NSObject {
    @objc public static let titleXL: CGFloat = 40
    @objc public static let titleL: CGFloat = 35
    @objc public static let titleM: CGFloat = 30
    @objc public static let titleS: CGFloat = 25
    @objc public static let titleXS: CGFloat = 22

    @objc public static let bodyL: CGFloat = 22
    @objc public static let bodyM: CGFloat = 20
    @objc public static let bodyS: CGFloat = 18
    @objc public static let bodyXS: CGFloat = 15
}
