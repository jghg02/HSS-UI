//
//  HSSCheckbox.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
import UIKit

@objc public class HSSCheckbox: UIView, HSSUIAccessibleView {

    internal var contentView: HSSCheckboxView!

    var accessibilityManager: HSSUIAccessibilityManager?

    /// Sets the title of the HSSCheckbox
    @IBInspectable public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the type of the HSSCaheckbox , default idle
   @objc public var type: HSSCheckboxType = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the slign of the HSSCaheckbox , default left
    @objc public var align: HSSCheckboxAlign = .left {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the status of the HSSCaheckbox , default unselected
    @objc public var status: HSSCheckboxStatus = .unselected {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the title Number of Lines of the HSSCheckbox , default 1
    @objc public var titleNumberOfLines: Int = 1 {
        didSet {
            self.updateContentView()
        }
    }

    @objc internal var context: HSSCheckboxContext = .component {
        didSet {
            self.updateContentView()
        }
    }

    /// Callback invoked when checkbox button is tapped
    internal var didTapped: ((HSSCheckbox) -> Void)?

    override public func accessibilityActivate() -> Bool {
        return accessibilityManager?.accessibilityActivated() != nil
    }

    /// Set dismiss callback to be invoked when checkbox button is pressed
    @objc public func setCheckboxDidTapped(callback: @escaping ((HSSCheckbox) -> Void)) {
        self.didTapped = callback
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(type: HSSCheckboxType, align: HSSCheckboxAlign, status: HSSCheckboxStatus, title: String? = nil) {
        super.init(frame: .zero)
        self.title = title
        self.type = type
        self.align = align
        self.status = status
        setup()
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let config = HSSCheckboxViewConfig(for: self)
        contentView = HSSCheckboxDefaultView(withConfig: config, delegate: self)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        accessibilityManager = HSSCheckboxAccessibilityManager(view: self)
    }

    private func updateContentView() {
        let config = HSSCheckboxViewConfig(for: self)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }
}

extension HSSCheckbox: HSSCheckboxViewDelegate {
    func checkboxTapped() {
        guard let callback = self.didTapped else {
            return
        }
        switch self.type {
        case .error:
            self.type = .idle
            self.status = .selected
        case .idle:
            if self.status == .selected {
                self.status = .unselected
            } else if self.status == .unselected || self.status == .undefined {
                self.status = .selected
            }
        case .disabled:
            // Never happen
            return
        }
        updateContentView()
        callback(self)
    }
}

// MARK: - IB interface
public extension HSSCheckbox {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = HSSCheckboxType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'status' instead.")
    @IBInspectable var ibStatus: String {
        set(val) {
            self.status = HSSCheckboxStatus.checkValidEnum(property: "IB status", key: val)
        }
        get {
            return self.status.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'align' instead.")
    @IBInspectable var ibAlign: String {
        set(val) {
            self.align = HSSCheckboxAlign.checkValidEnum(property: "IB align", key: val)
        }
        get {
            return self.align.toString()
        }
    }
}

