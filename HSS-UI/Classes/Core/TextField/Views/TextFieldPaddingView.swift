//
//  TextFieldPaddingView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class TextFieldPaddingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(size: CGFloat) {
        self.init(frame: CGRect(x: 0, y: 0, width: size, height: 10))
    }
}
