//
//  HSSLabel.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation
import UIKit

public class HSSLabel: UILabel, HSSUIAccessibleView {

    private(set) var bodyBolds: HSSBodyBolds?
    private(set) var bodyLinks: HSSBodyLinks?
    private var type: HSSLabelType = .body
    private var isLinkColorInverted: Bool = false
    private var boldHSSFontStyle = HSSFontStyle(textColor: HSSStyleSheetManager.styleSheet.textColorPrimary,
                                                font: HSSStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: HSSFontSize.bodyM),
                                                lineSpacing: 5,
                                                fontLineHeight: HSSFontSizeLineHeight.bodyM)

    private var normalHSSFontStyle = HSSFontStyle(textColor: HSSStyleSheetManager.styleSheet.textColorPrimary,
                                                  font: HSSStyleSheetManager.styleSheet.regularSystemFont(size: HSSFontSize.bodyS),
                                                  lineSpacing: 5,
                                                  fontLineHeight: HSSFontSizeLineHeight.bodyM)
    var accessibilityManager: HSSUIAccessibilityManager?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupGesture()
        self.setupBaseFont()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupGesture()
        self.setupBaseFont()
    }

    private func setupBaseFont() {
        self.font = HSSStyleSheetManager.styleSheet.regularSystemFont(size: HSSFontSize.bodyS)
    }

    @objc
    public func setStyleAsTitle(titleConfig: HSSLabelTitleConfig) {
        self.type = .title
        self.bodyLinks = titleConfig.bodyLinks
        self.bodyBolds = nil
        self.normalHSSFontStyle = titleConfig.fontStyle
        self.isLinkColorInverted = titleConfig.isLinkColorInverted
        self.setup()
    }

    @objc
    public func setStyleAsBody(bodyConfig: HSSLabelBodyConfig) {
        self.type = .body
        self.bodyLinks = bodyConfig.bodyLinks
        self.bodyBolds = bodyConfig.bodyBolds
        self.normalHSSFontStyle = bodyConfig.fontStyle
        self.boldHSSFontStyle = bodyConfig.fontStyleBold
        self.isLinkColorInverted = bodyConfig.isLinkColorInverted
        self.setup()
    }

    internal func setStyleAsInternal(internalConfig: HSSLabelInternalConfig) {
        self.type = .body // body with custom sizes
        self.bodyLinks = internalConfig.bodyLinks
        self.bodyBolds = internalConfig.bodyBolds
        self.normalHSSFontStyle = internalConfig.fontStyle
        self.boldHSSFontStyle = internalConfig.fontStyleBold
        self.isLinkColorInverted = internalConfig.isLinkColorInverted
        self.setup()
    }

    private func setup() {
        if let text = self.text {
            self.numberOfLines = self.numberOfLines
            self.attributedText = self.getAttributedTextWithLinks(text: text)
            self.sizeToFit()
            if let manager = self.accessibilityManager as? HSSLabelAccessibilityManager {
                manager.clearA11yText()
                manager.addToA11y(text: text)
                manager.viewUpdated()
            }
        }
    }

    private func setupGesture() {
        self.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapgesture)
        accessibilityManager = HSSLabelAccessibilityManager(view: self)
    }

    private func getAttributedTextWithLinks(text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let allRange = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.foregroundColor, value: normalHSSFontStyle.textColor, range: allRange)
        attributedString.addAttribute(.font, value: normalHSSFontStyle.font, range: allRange)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        //        paragraphStyle.lineSpacing = normalHSSFontStyle.fontLineHeight / normalHSSFontStyle.font.pointSize
        paragraphStyle.maximumLineHeight = normalHSSFontStyle.fontLineHeight
        paragraphStyle.minimumLineHeight = normalHSSFontStyle.fontLineHeight

        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: allRange)
        let linkColor = (self.isLinkColorInverted) ? HSSStyleSheetManager.styleSheet.bgColorWhite: HSSStyleSheetManager.styleSheet.textColorLink
        if let bodyBolds = self.bodyBolds {
            for (_, bold) in bodyBolds.bolds.enumerated() {
                if bold.isValidRange(attributedString) {
                    let range = NSRange(location: bold.startIndex, length: bold.endIndex - bold.startIndex)
                    attributedString.removeAttribute(.font, range: range)
                    attributedString.removeAttribute(.foregroundColor, range: range)
                    attributedString.addAttribute(.font, value: self.boldHSSFontStyle.font, range: range)
                    attributedString.addAttribute(.foregroundColor, value: boldHSSFontStyle.textColor, range: range)
                }
            }
        }

        if let bodyLinks = self.bodyLinks {
            for (_, link) in bodyLinks.links.enumerated() {
                if link.isValidRange(attributedString) {
                    let range = NSRange(location: link.startIndex, length: link.endIndex - link.startIndex)
                    let linkCustomAttributes = [
                        .foregroundColor: linkColor,
                        .underlineColor: linkColor,
                        .underlineStyle: NSUnderlineStyle.styleDouble.rawValue
                    ]  as [NSAttributedString.Key: Any]
                    attributedString.addAttributes(linkCustomAttributes, range: range)
                }
            }
        }

        return attributedString
    }

    @objc internal func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let _ = self.text, let links = self.bodyLinks?.links  else { return }
        let linksCount = links.count
        if linksCount > 0 {
            for index in 0...linksCount-1 {
                let link = links[index]
                let start = link.startIndex
                let length = link.endIndex - link.startIndex
                let range = NSRange(location: start, length: length)
                if gesture.didTapAttributedTextInLabel(label: self, inRange: range) {
                    self.bodyLinks?.listener(index)
                }
            }
        }
    }

    override public func accessibilityActivate() -> Bool {
        accessibilityManager?.accessibilityActivated()
        return accessibilityManager != nil
    }
    @objc
    public func clear() {
        self.attributedText = NSAttributedString(string: "")
        if let manager = self.accessibilityManager as? HSSLabelAccessibilityManager {
            manager.clearA11yText()
        }

    }
    @objc
    public func append(text: String, HSSColor: HSSLabelColor) {
        self.append(text: text, color: HSSColor.color)
    }
    @objc
    public func append(text: String, color: UIColor? = nil) {
        let combination = NSMutableAttributedString(  )
        if let attributedText = self.attributedText {
            combination.append(attributedText)
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        paragraphStyle.lineSpacing = normalHSSFontStyle.fontLineHeight / normalHSSFontStyle.font.pointSize
        let newAttributedString = NSMutableAttributedString(string: text)
        let allRange = NSRange(location: 0, length: newAttributedString.length)
        newAttributedString.removeAttribute(.foregroundColor, range: allRange)
        if let colorToApply = color {
            newAttributedString.addAttribute(.foregroundColor, value: colorToApply, range: allRange)
        } else {
            newAttributedString.addAttribute(.foregroundColor, value: normalHSSFontStyle.textColor, range: allRange)
        }
        newAttributedString.addAttribute(.font, value: normalHSSFontStyle.font, range: allRange)
        newAttributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: allRange)
        combination.append(newAttributedString)

        if let manager = self.accessibilityManager as? HSSLabelAccessibilityManager {
            manager.addToA11y(text: text)
        }
        self.attributedText = combination

    }

    @objc
    public func updateColor(text: String, HSSColor: HSSLabelColor) {
        self.updateColor(text: text, color: HSSColor.color)
    }

    @objc
    public func updateColor(text: String, color: UIColor) {
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(attributedString: self.attributedText ?? NSAttributedString(string: ""))
        let range: NSRange = attrStr.mutableString.range(of: text, options: .caseInsensitive)
        attrStr.removeAttribute(.foregroundColor, range: range)
        attrStr.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedText = attrStr
    }

    @objc
    public func updateColor(range: NSRange, HSSColor: HSSLabelColor) {
        self.updateColor(range: range, color: HSSColor.color)
    }

    @objc
    public func updateColor(range: NSRange, color: UIColor) {
        let attrStr: NSMutableAttributedString = NSMutableAttributedString(attributedString: self.attributedText ?? NSAttributedString(string: ""))
        attrStr.removeAttribute(.foregroundColor, range: range)
        attrStr.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedText = attrStr
    }
    
}

