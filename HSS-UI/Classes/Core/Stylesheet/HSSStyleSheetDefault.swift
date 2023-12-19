//
//  HSSStyleSheetDefault.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

@objc public class HSSStyleSheetDefault: NSObject, HSSStyleSheet {

    private var stylesheetStrategy: HSSColors

    public lazy var bgColorPrimary: UIColor = self.stylesheetStrategy.bgColorPrimary
    public lazy var bgColorSecondary: UIColor = self.stylesheetStrategy.bgColorSecondary
    public lazy var bgColorWhite: UIColor = self.stylesheetStrategy.bgColorWhite

    public lazy var brandColor500: UIColor = self.stylesheetStrategy.brandColor500

    public lazy var accentColor: UIColor = self.stylesheetStrategy.accentColor
    public lazy var accentColor100: UIColor = self.stylesheetStrategy.accentColor100
    public lazy var accentColor150: UIColor = self.stylesheetStrategy.accentColor150
    public lazy var accentColor200: UIColor = self.stylesheetStrategy.accentColor200
    public lazy var accentColor300: UIColor = self.stylesheetStrategy.accentColor300
    public lazy var accentColor400: UIColor = self.stylesheetStrategy.accentColor400
    public lazy var accentColor500: UIColor = self.stylesheetStrategy.accentColor500
    public lazy var accentColor600: UIColor = self.stylesheetStrategy.accentColor600
    public lazy var accentColor700: UIColor = self.stylesheetStrategy.accentColor700
    public lazy var accentColor800: UIColor = self.stylesheetStrategy.accentColor800

    public lazy var textColorPrimary: UIColor = self.stylesheetStrategy.textColorPrimary
    public lazy var textColorSecondary: UIColor = self.stylesheetStrategy.textColorSecondary
    public lazy var textColorDisabled: UIColor = self.stylesheetStrategy.textColorDisabled
    public lazy var textColorNegative: UIColor = self.stylesheetStrategy.textColorNegative
    public lazy var textColorCaution: UIColor = self.stylesheetStrategy.textColorCaution
    public lazy var textColorPositive: UIColor = self.stylesheetStrategy.textColorPositive
    public lazy var tetColorLink: UIColor = self.stylesheetStrategy.tetColorLink
    public lazy var textColorLink: UIColor = self.stylesheetStrategy.textColorLink
    public lazy var textColorWhite: UIColor = self.stylesheetStrategy.textColorWhite
    public lazy var textColorWarning: UIColor = self.stylesheetStrategy.textColorWarning

    public lazy var feedbackColorCaution: UIColor = self.stylesheetStrategy.feedbackColorCaution
    public lazy var feedbackColorPositive: UIColor = self.stylesheetStrategy.feedbackColorPositive
    public lazy var feedbackColorNegative: UIColor = self.stylesheetStrategy.feedbackColorNegative
    public lazy var feedbackColorWarning: UIColor = self.stylesheetStrategy.feedbackColorWarning

    /// Secondary Colors
    public lazy var secondaryA100: UIColor = self.stylesheetStrategy.secondaryA100
    public lazy var secondaryA200: UIColor = self.stylesheetStrategy.secondaryA200
    public lazy var secondaryA300: UIColor = self.stylesheetStrategy.secondaryA300
    public lazy var secondaryA400: UIColor = self.stylesheetStrategy.secondaryA400
    public lazy var secondaryA500: UIColor = self.stylesheetStrategy.secondaryA500
    public lazy var secondaryA600: UIColor = self.stylesheetStrategy.secondaryA600
    public lazy var secondaryA700: UIColor = self.stylesheetStrategy.secondaryA700
    public lazy var secondaryA800: UIColor = self.stylesheetStrategy.secondaryA800
    public lazy var secondaryA900: UIColor = self.stylesheetStrategy.secondaryA900
    public lazy var secondaryB100: UIColor = self.stylesheetStrategy.secondaryB100
    public lazy var secondaryB200: UIColor = self.stylesheetStrategy.secondaryB200
    public lazy var secondaryB300: UIColor = self.stylesheetStrategy.secondaryB300
    public lazy var secondaryB400: UIColor = self.stylesheetStrategy.secondaryB400
    public lazy var secondaryB500: UIColor = self.stylesheetStrategy.secondaryB500
    public lazy var secondaryB600: UIColor = self.stylesheetStrategy.secondaryB600
    public lazy var secondaryB700: UIColor = self.stylesheetStrategy.secondaryB700
    public lazy var secondaryB800: UIColor = self.stylesheetStrategy.secondaryB800
    public lazy var secondaryB900: UIColor = self.stylesheetStrategy.secondaryB900
    public lazy var secondaryC100: UIColor = self.stylesheetStrategy.secondaryC100
    public lazy var secondaryC200: UIColor = self.stylesheetStrategy.secondaryC200
    public lazy var secondaryC300: UIColor = self.stylesheetStrategy.secondaryC300
    public lazy var secondaryC400: UIColor = self.stylesheetStrategy.secondaryC400
    public lazy var secondaryC500: UIColor = self.stylesheetStrategy.secondaryC500
    public lazy var secondaryC600: UIColor = self.stylesheetStrategy.secondaryC600
    public lazy var secondaryC700: UIColor = self.stylesheetStrategy.secondaryC700
    public lazy var secondaryC800: UIColor = self.stylesheetStrategy.secondaryC800
    public lazy var secondaryC900: UIColor = self.stylesheetStrategy.secondaryC900
    public lazy var secondaryD100: UIColor = self.stylesheetStrategy.secondaryD100
    public lazy var secondaryD200: UIColor = self.stylesheetStrategy.secondaryD200
    public lazy var secondaryD300: UIColor = self.stylesheetStrategy.secondaryD300
    public lazy var secondaryD400: UIColor = self.stylesheetStrategy.secondaryD400
    public lazy var secondaryD500: UIColor = self.stylesheetStrategy.secondaryD500
    public lazy var secondaryD600: UIColor = self.stylesheetStrategy.secondaryD600
    public lazy var secondaryD700: UIColor = self.stylesheetStrategy.secondaryD700
    public lazy var secondaryD800: UIColor = self.stylesheetStrategy.secondaryD800
    public lazy var secondaryD900: UIColor = self.stylesheetStrategy.secondaryD900
    public lazy var secondaryE100: UIColor = self.stylesheetStrategy.secondaryE100
    public lazy var secondaryE200: UIColor = self.stylesheetStrategy.secondaryE200
    public lazy var secondaryE300: UIColor = self.stylesheetStrategy.secondaryE300
    public lazy var secondaryE400: UIColor = self.stylesheetStrategy.secondaryE400
    public lazy var secondaryE500: UIColor = self.stylesheetStrategy.secondaryE500
    public lazy var secondaryE600: UIColor = self.stylesheetStrategy.secondaryE600
    public lazy var secondaryE700: UIColor = self.stylesheetStrategy.secondaryE700
    public lazy var secondaryE800: UIColor = self.stylesheetStrategy.secondaryE800
    public lazy var secondaryE900: UIColor = self.stylesheetStrategy.secondaryE900
    public lazy var secondaryF100: UIColor = self.stylesheetStrategy.secondaryF100
    public lazy var secondaryF200: UIColor = self.stylesheetStrategy.secondaryF200
    public lazy var secondaryF300: UIColor = self.stylesheetStrategy.secondaryF300
    public lazy var secondaryF400: UIColor = self.stylesheetStrategy.secondaryF400
    public lazy var secondaryF500: UIColor = self.stylesheetStrategy.secondaryF500
    public lazy var secondaryF600: UIColor = self.stylesheetStrategy.secondaryF600
    public lazy var secondaryF700: UIColor = self.stylesheetStrategy.secondaryF700
    public lazy var secondaryF800: UIColor = self.stylesheetStrategy.secondaryF800
    public lazy var secondaryF900: UIColor = self.stylesheetStrategy.secondaryF900
    public lazy var secondaryG100: UIColor = self.stylesheetStrategy.secondaryG100
    public lazy var secondaryG200: UIColor = self.stylesheetStrategy.secondaryG200
    public lazy var secondaryG300: UIColor = self.stylesheetStrategy.secondaryG300
    public lazy var secondaryG400: UIColor = self.stylesheetStrategy.secondaryG400
    public lazy var secondaryG500: UIColor = self.stylesheetStrategy.secondaryG500
    public lazy var secondaryG600: UIColor = self.stylesheetStrategy.secondaryG600
    public lazy var secondaryG700: UIColor = self.stylesheetStrategy.secondaryG700
    public lazy var secondaryG800: UIColor = self.stylesheetStrategy.secondaryG800
    public lazy var secondaryG900: UIColor = self.stylesheetStrategy.secondaryG900
    public lazy var secondaryH100: UIColor = self.stylesheetStrategy.secondaryH100
    public lazy var secondaryH200: UIColor = self.stylesheetStrategy.secondaryH200
    public lazy var secondaryH300: UIColor = self.stylesheetStrategy.secondaryH300
    public lazy var secondaryH400: UIColor = self.stylesheetStrategy.secondaryH400
    public lazy var secondaryH500: UIColor = self.stylesheetStrategy.secondaryH500
    public lazy var secondaryH600: UIColor = self.stylesheetStrategy.secondaryH600
    public lazy var secondaryH700: UIColor = self.stylesheetStrategy.secondaryH700
    public lazy var secondaryH800: UIColor = self.stylesheetStrategy.secondaryH800
    public lazy var secondaryH900: UIColor = self.stylesheetStrategy.secondaryH900
    public lazy var secondaryI100: UIColor = self.stylesheetStrategy.secondaryI100
    public lazy var secondaryI200: UIColor = self.stylesheetStrategy.secondaryI200
    public lazy var secondaryI300: UIColor = self.stylesheetStrategy.secondaryI300
    public lazy var secondaryI400: UIColor = self.stylesheetStrategy.secondaryI400
    public lazy var secondaryI500: UIColor = self.stylesheetStrategy.secondaryI500
    public lazy var secondaryI600: UIColor = self.stylesheetStrategy.secondaryI600
    public lazy var secondaryI700: UIColor = self.stylesheetStrategy.secondaryI700
    public lazy var secondaryI800: UIColor = self.stylesheetStrategy.secondaryI800
    public lazy var secondaryI900: UIColor = self.stylesheetStrategy.secondaryI900
    public lazy var secondaryJ100: UIColor = self.stylesheetStrategy.secondaryJ100
    public lazy var secondaryJ200: UIColor = self.stylesheetStrategy.secondaryJ200
    public lazy var secondaryJ300: UIColor = self.stylesheetStrategy.secondaryJ300
    public lazy var secondaryJ400: UIColor = self.stylesheetStrategy.secondaryJ400
    public lazy var secondaryJ500: UIColor = self.stylesheetStrategy.secondaryJ500
    public lazy var secondaryJ600: UIColor = self.stylesheetStrategy.secondaryJ600
    public lazy var secondaryJ700: UIColor = self.stylesheetStrategy.secondaryJ700
    public lazy var secondaryJ800: UIColor = self.stylesheetStrategy.secondaryJ800
    public lazy var secondaryJ900: UIColor = self.stylesheetStrategy.secondaryJ900
    public lazy var secondaryK100: UIColor = self.stylesheetStrategy.secondaryK100
    public lazy var secondaryK200: UIColor = self.stylesheetStrategy.secondaryK200
    public lazy var secondaryK300: UIColor = self.stylesheetStrategy.secondaryK300
    public lazy var secondaryK400: UIColor = self.stylesheetStrategy.secondaryK400
    public lazy var secondaryK500: UIColor = self.stylesheetStrategy.secondaryK500
    public lazy var secondaryK600: UIColor = self.stylesheetStrategy.secondaryK600
    public lazy var secondaryK700: UIColor = self.stylesheetStrategy.secondaryK700
    public lazy var secondaryK800: UIColor = self.stylesheetStrategy.secondaryK800
    public lazy var secondaryK900: UIColor = self.stylesheetStrategy.secondaryK900
    public lazy var secondaryL100: UIColor = self.stylesheetStrategy.secondaryL100
    public lazy var secondaryL200: UIColor = self.stylesheetStrategy.secondaryL200
    public lazy var secondaryL300: UIColor = self.stylesheetStrategy.secondaryL300
    public lazy var secondaryL400: UIColor = self.stylesheetStrategy.secondaryL400
    public lazy var secondaryL500: UIColor = self.stylesheetStrategy.secondaryL500
    public lazy var secondaryL600: UIColor = self.stylesheetStrategy.secondaryL600
    public lazy var secondaryL700: UIColor = self.stylesheetStrategy.secondaryL700
    public lazy var secondaryL800: UIColor = self.stylesheetStrategy.secondaryL800
    public lazy var secondaryL900: UIColor = self.stylesheetStrategy.secondaryL900

    public override init() {
        self.stylesheetStrategy = HSSColorStrategyiOS10()
    }

    public func titleXL(color: UIColor) -> HSSFontStyle {
        validateColorForTitle(color: color)
        return HSSFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: HSSFontSize.titleXL), lineSpacing: 1.25)
    }

    public func titleL(color: UIColor) -> HSSFontStyle {
        validateColorForTitle(color: color)
        return HSSFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: HSSFontSize.titleL), lineSpacing: 1.25)
    }

    public func titleM(color: UIColor) -> HSSFontStyle {
        validateColorForTitle(color: color)
        return HSSFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: HSSFontSize.titleM), lineSpacing: 1.25)
    }

    public func titleS(color: UIColor) -> HSSFontStyle {
        validateColorForTitle(color: color)
        return HSSFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: HSSFontSize.titleS), lineSpacing: 1.25)
    }

    public func titleXS(color: UIColor) -> HSSFontStyle {
        validateColorForTitle(color: color)
        return HSSFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: HSSFontSize.titleXS), lineSpacing: 1.25)
    }

    public func bodyL(color: UIColor) -> HSSFontStyle {
        validateColorForBody(color: color)
        return HSSFontStyle(textColor: color, font: regularSystemFont(size: HSSFontSize.bodyL), lineSpacing: 1.25)
    }

    public func bodyM(color: UIColor) -> HSSFontStyle {
        validateColorForBody(color: color)
        return HSSFontStyle(textColor: color, font: regularSystemFont(size: HSSFontSize.bodyM), lineSpacing: 1.25)
    }

    public func bodyS(color: UIColor) -> HSSFontStyle {
        validateColorForBody(color: color)
        return HSSFontStyle(textColor: color, font: regularSystemFont(size: HSSFontSize.bodyS), lineSpacing: 1.25)
    }

    public func bodyXS(color: UIColor) -> HSSFontStyle {
        validateColorForBody(color: color)
        return HSSFontStyle(textColor: color, font: regularSystemFont(size: HSSFontSize.bodyXS), lineSpacing: 1.25)
    }

    public func regularSystemFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    public func lightSystemFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    public func mediumSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    public func semiboldSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    private func validateColorForTitle(color: UIColor) {
        if !color.isEqual(self.stylesheetStrategy.textColorWhite) && !color.isEqual(self.stylesheetStrategy.textColorPrimary) {
            fatalError("You must use an allowed color. Please check Andes documentation")
        }
    }

    private func validateColorForBody(color: UIColor) {
        if !color.isEqual(self.stylesheetStrategy.textColorPrimary) && !color.isEqual(self.stylesheetStrategy.textColorSecondary) &&
            !color.isEqual(self.stylesheetStrategy.textColorWhite) &&
            !color.isEqual(self.stylesheetStrategy.textColorDisabled) {
            fatalError("You must use an allowed color. Please check Andes documentation")
        }
    }

    private func validateColorForLink(color: UIColor) {
        if !color.isEqual(self.stylesheetStrategy.textColorLink) {
            fatalError("You must use an allowed color. Please check Andes documentation")
        }
    }
}

