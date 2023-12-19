//
//  HSSTextField.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import UIKit

@objc public class HSSTextField: UIView, HSSUIAccessibleView {
    internal var contentView: HSSTextFieldView!

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

    /// Sets the helper links label text
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

    /// sets the left component, only supperted for simple TextField
    @objc public var leftContent: HSSTextFieldLeftComponent? {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the right component, only supperted for simple TextField
    @objc public var rightContent: HSSTextFieldRightComponent? {
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

    @objc public var attributeText: NSAttributedString? {
        didSet {
            contentView.attributeText = attributeText
        }
    }

    @objc public var isSecureTextEntry: Bool = false {
        didSet {
            self.updateContentView()
        }
    }

    @objc public weak var delegate: HSSTextFieldDelegate?

    internal private(set) var inputTraits: UITextInputTraits? {
        didSet {
            self.updateContentView()
        }
    }

    internal private(set) var isEditing: Bool = false

    var accessibilityManager: HSSUIAccessibilityManager?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(state: HSSTextInputState, label: String?, helper: String?, counter: UInt16, placeholder: String?, helperLinks: HSSBodyLinks? = nil, helperBolds: HSSBodyBolds? = nil) {
        super.init(frame: .zero)
        self.label = label
        self.helper = helper
        self.placeholder = placeholder
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
        accessibilityManager = HSSTextFieldAccessibilityManager(view: self)
    }

    private func updateContentView() {
        let config = HSSTextFieldViewConfigFactory.provideInternalConfig(from: self)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }

    @objc public func setCustomInputTraits(_ traits: UITextInputTraits) {
        self.inputTraits = traits
        self.textInputTraits = .custom
    }

    /// Should return a view depending on which textfield variant is selected
    private func provideView() -> HSSTextFieldAbstractView {
        let config = HSSTextFieldViewConfigFactory.provideInternalConfig(from: self)
        return HSSTextFieldDefaultView(withConfig: config)
    }

    internal func onTapCheckbox(with status: HSSCheckboxStatus) {
        self.delegate?.hssTextFieldDidTapRightCheckbox?(self, with: status)
    }
}

extension HSSTextField {
    // MARK: - Keyboard Management
    @discardableResult
    @objc public override func resignFirstResponder() -> Bool {
        contentView.resignFirstResponder()
    }

    @discardableResult
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

extension HSSTextField: HSSTextFieldViewDelegate {
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool) {
        delegate?.hssTextField?(self, didDeleteBackwardAnd: wasEmpty)
    }

    func shouldBeginEditing() -> Bool {
        return delegate?.hssTextFieldShouldBeginEditing?(self) != false
    }

    func shouldEndEditing() -> Bool {
        return delegate?.hssTextFieldShouldEndEditing?(self) != false
    }

    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.hssTextField?(self, shouldChangeCharactersIn: range, replacementString: string)  != false
    }

    func didChangeSelection(selectedRange range: UITextRange?) {
        if #available(iOS 13, *) {
            delegate?.hssTextFieldDidChangeSelection?(self, selectedRange: range)
        }
    }

    func didBeginEditing() {
        isEditing = true
        updateContentView()
        delegate?.hssTextFieldDidBeginEditing?(self)
    }

    func didEndEditing(text: String) {
        isEditing = false
        updateContentView()
        delegate?.hssTextFieldDidEndEditing?(self)
    }

    func didChange() {
        accessibilityManager?.viewUpdated()
        delegate?.hssTextFieldDidChange?(self)
    }

    func didTapRightAction() {
        delegate?.hssTextFieldDidTapRightAction?(self)
    }

    func shouldReturn() -> Bool {
        delegate?.hssTextFieldShouldReturn?(self) != false
    }
}

// MARK: - IB Enum Adapters
public extension HSSTextField {
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


