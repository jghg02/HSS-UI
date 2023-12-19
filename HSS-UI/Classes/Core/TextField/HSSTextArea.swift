//
//  HSSTextArea.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

import UIKit

@objc public class HSSTextArea: UIView {
    internal var contentView: HSSTextFieldView!

    /// Attribute for textfield
    @objc public var attributeText: NSAttributedString? {
        didSet {
            contentView.attributeText = attributeText
        }
    }

    /// The state of an HSSTextfield defines its behaviours an colours.
    @objc public var state: HSSTextInputState = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Text for the label of the textfield
    @IBInspectable public var label: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the helper label text
    @IBInspectable public var helper: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the helper action label text
    @objc public var helperLinks: HSSBodyLinks? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the helper bold label text
    @objc public var helperBolds: HSSBodyBolds? {
        didSet {
            self.updateContentView()
        }
    }

    /// if 0, its unlimited, anything else its the limit of chars the user can input.
    @IBInspectable public var counter: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the placeholder label text.
    @IBInspectable public var placeholder: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the placeholder label text.
    @IBInspectable public var maxLines: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    /// Use the predefined text input traits, if you need more customization, use setCustomInputTraits
    @objc public var textInputTraits: HSSTextInputTraits = .custom {
        didSet {
            guard textInputTraits != .custom else {
                return
            }
            inputTraits = HSSTextInputTraitsFactory.getTraits(for: textInputTraits)
        }
    }

    /// returns the current text
    @IBInspectable public var text: String {
        get { return contentView.text }
        set { contentView.text = newValue }
    }

    @objc public weak var delegate: HSSTextAreaDelegate?

    internal private(set) var inputTraits: UITextInputTraits? {
        didSet {
            self.updateContentView()
        }
    }

    internal private(set) var isEditing: Bool = false

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(state: HSSTextInputState, label: String?, helper: String?, counter: UInt16, placeholder: String?, maxLines: UInt16 = 0, helperLinks: HSSBodyLinks? = nil, helperBolds: HSSBodyBolds? = nil) {
        super.init(frame: .zero)
        self.label = label
        self.helper = helper
        self.placeholder = placeholder
        self.maxLines = maxLines
        self.counter = counter
        self.state = state
        self.helperLinks = helperLinks
        self.helperBolds = helperBolds
        setup()
    }

    private func drawContentView(with newView: HSSTextFieldAbstractView) {
        self.contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func updateContentView() {
        let config = HSSTextFieldViewConfigFactory.provideInternalConfig(from: self)
        contentView.update(withConfig: config)
    }

    @objc public func setCustomInputTraits(_ traits: UITextInputTraits) {
        self.inputTraits = traits
        self.textInputTraits = .custom
    }

    /// Should return a view depending on which textfield variant is selected
    private func provideView() -> HSSTextFieldAbstractView {
        let config = HSSTextFieldViewConfigFactory.provideInternalConfig(from: self)
        return HSSTextAreaView(withConfig: config)
    }
}
extension HSSTextArea {
    // MARK: - Keyboard Management
    @objc public override func resignFirstResponder() -> Bool {
        contentView.resignFirstResponder()
    }

    @objc public override func becomeFirstResponder() -> Bool {
        contentView.becomeFirstResponder()
    }

    @objc public override var isFirstResponder: Bool {
        return contentView.isFirstResponder
    }

    @objc override public var inputView: UIView? {
        get {
            return contentView.customInputView
        }
        set {
            contentView.customInputView = newValue
        }
    }

    @objc override public var inputAccessoryView: UIView? {
        get {
            return contentView.customInputAccessoryView
        }
        set {
            contentView.customInputAccessoryView = newValue
        }
    }
}

extension HSSTextArea: HSSTextFieldViewDelegate {
    func shouldBeginEditing() -> Bool {
        return delegate?.hssTextAreaShouldBeginEditing?(self) != false
    }

    func shouldEndEditing() -> Bool {
        return delegate?.hssTextAreaShouldEndEditing?(self) != false
    }

    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.hssTextArea?(self, shouldChangeCharactersIn: range, replacementString: string)  != false
    }

    func didChangeSelection(selectedRange range: UITextRange?) {
        delegate?.hssTextAreaDidChangeSelection?(self, selectedRange: range)
    }

    func didBeginEditing() {
        isEditing = true
        updateContentView()
        delegate?.hssTextAreaDidBeginEditing?(self)
    }

    func didEndEditing(text: String) {
        isEditing = false
        updateContentView()
        delegate?.hssTextAreaDidEndEditing?(self)
    }

    func didChange() {
        delegate?.hssTextAreaDidChange?(self)
    }
}

// MARK: - IB Enum Adapters
public extension HSSTextArea {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
    @IBInspectable var ibState: String {
        set(val) {
            self.state = HSSTextInputState.checkValidEnum(property: "IB State", key: val)
        }
        get {
            return ""
        }
    }
}

