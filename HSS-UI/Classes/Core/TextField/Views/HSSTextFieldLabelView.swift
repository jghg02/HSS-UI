//
//  HSSTextFieldLabelView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSTextFieldLabelView: UIView {
    private(set) var text: String?
    private var style: HSSFontStyle?
    private static let smallMargin: CGFloat = 8

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(text: String, style: HSSFontStyle, forceLeftPadding leftPadding: CGFloat = HSSTextFieldLabelView.smallMargin, forceRightPadding rightPadding: CGFloat = HSSTextFieldLabelView.smallMargin) {
        self.init()

        self.text = text
        self.style = style
        setUp(leftPadding: leftPadding, rightPadding: rightPadding)
    }

    func setUp(leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let text = self.text, let style = self.style else {
            return
        }

        let label = UILabel()
        label.text = text
        label.setHSSStyle(style: style)
        label.sizeToFit()
        self.addSubview(label)
        label.pinToSuperview(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
    }
}
