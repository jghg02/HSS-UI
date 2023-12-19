//
//  HSSTextFieldCheckboxView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
import PureLayout

class HSSTextFieldCheckboxView: UIView {
    private var text: String?
    private var status: HSSCheckboxStatus = .unselected
    private weak var delegate: HSSTextField?

    init(with text: String?, status: HSSCheckboxStatus, delegate: HSSTextField?) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.text = text
        self.status = status
        self.setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        let checkbox = HSSCheckbox(type: .idle, align: .right, status: status, title: text)
        checkbox.context = .textField
        checkbox.setCheckboxDidTapped(callback: self.onTap(checkbox:))
        self.addSubview(checkbox)
        checkbox.autoPinEdge(toSuperviewEdge: .right, withInset: 12)
        checkbox.autoAlignAxis(toSuperviewAxis: .horizontal)
        checkbox.autoPinEdge(toSuperviewEdge: .left)
    }

    internal func onTap(checkbox: HSSCheckbox) {
        delegate?.onTapCheckbox(with: checkbox.status)
    }
}
