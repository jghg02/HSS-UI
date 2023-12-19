//
//  HSSTextFieldDefaultView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation


class HSSTextFieldDefaultView: HSSTextFieldAbstractView {
    @IBOutlet weak var textField: UITextField!

    override var text: String {
        get {
            guard let text = textField.text else {
                return ""
            }
            return text
        }
        set(value) {
            textField.text = value
            textChanged(self.textField)
        }
    }

    override var attributeText: NSAttributedString? {
        didSet {
            textField.attributedText = attributeText
        }
    }

    override var customInputView: UIView? {
        get {
            return textField.inputView
        }
        set (value) {
            textField.inputView = value
        }
    }

    override var innerTextField: UITextField? {
        get {
            return textField
        } set { }
    }

    private var accessoryView: UIView?
    override var customInputAccessoryView: UIView? {
        get {
            return accessoryView
        }
        set (value) {
            accessoryView = value
            textField.inputAccessoryView = value
        }
    }

    var currentVisibilities: [HSSTextFieldComponentVisibility] {
        return self.text.isEmpty ? [.always] : [.always, .whenNotEmpty]
    }

    override func loadNib() {
        let bundle = HSSBundle.bundle()
        bundle.loadNibNamed("HSSTextFieldDefaultView", owner: self, options: nil)
        textField.center = self.center
        textField.leftView?.center = self.center
        textField.rightView?.center = self.center
    }

    override func clear() {
        super.clear()
        updateSideComponents()
    }

    override func setup() {
        super.setup()
        self.textField.delegate = self
        self.textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.addTarget(self, action: #selector(self.textChanged), for: UIControl.Event.editingChanged)
    }

    @objc func textChanged(_ textField: UITextField) {
        // side components
        self.updateSideComponents()
        self.checkLengthAndUpdateCounterLabel()
        self.delegate?.didChange()
    }

    override func updateView() {
        super.updateView()
        if let placeholder = config.placeholderText {
            let placeholderAttrs = [NSAttributedString.Key.font: config.placeholderStyle.font,
                                    NSAttributedString.Key.foregroundColor: config.placeholderStyle.textColor]
            self.textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttrs)
        }

        self.textField.textColor = config.inputTextStyle.textColor
        self.textField.font = config.inputTextStyle.font
        self.textField.isEnabled = config.editingEnabled
        if let traits = config.textInputTraits {
            self.textField.setInputTraits(traits)
        }

        // set side component views
        updateSideComponents()
    }

    func updateSideComponents() {
        let generatedLeftView: UIView? = HSSTextFieldComponentFactory.generateLeftComponentView(for: self.config, in: self, visibilities: self.currentVisibilities)
        let generatedRightView: UIView? = HSSTextFieldComponentFactory.generateRightComponentView(for: self.config, in: self, visibilities: self.currentVisibilities)

        if #available(iOS 13.0, *) {} else {
            // prior to ios 13, UITextField side views didn't use autolayout, have to calculate frame manually https://stackoverflow.com/questions/58166160/ios-13-spacing-issue-with-uitextfield-rightview
            if let generatedLeftView = generatedLeftView {
                let lSize = generatedLeftView.systemLayoutSizeFitting(.zero, withHorizontalFittingPriority: .defaultLow, verticalFittingPriority: .defaultLow)
                generatedLeftView.frame = CGRect(origin: .zero, size: lSize)
            }
            if let generatedRightView = generatedRightView {
                let rSize = generatedRightView.systemLayoutSizeFitting(.zero, withHorizontalFittingPriority: .defaultLow, verticalFittingPriority: .defaultLow)
                generatedRightView.frame = CGRect(origin: .zero, size: rSize)
            }
        }

        if config.rightViewComponent?.reloadPolicy == .onlyOneTime {
            if config.rightComponentNeedsReload {
                textField.rightView = self.checkbox(rightView: generatedRightView)
                config.rightComponentNeedsReload = false
            }
        } else {
            textField.rightView = self.checkbox(rightView: generatedRightView)
            config.rightComponentNeedsReload = true
        }

        if config.leftViewComponent?.reloadPolicy == .onlyOneTime {
            if config.leftComponentNeedsReload {
                textField.leftView = generatedLeftView
                config.leftComponentNeedsReload = false
            }
        } else {
            textField.leftView = generatedLeftView
            config.leftComponentNeedsReload = true
        }
    }

    func checkbox(rightView: UIView?) -> UIView? {
        let checkbox = self.textFieldContainerStackView.subviews.first(where: {
            HSSTextFieldCheckboxView.self === type(of: $0)
        })
        if let right = rightView as? HSSTextFieldCheckboxView {
            if checkbox == nil {
                self.textFieldContainerStackView.addArrangedSubview(right)
                self.textFieldContainerStackView.autoMatch(
                    .width, to: .width, of: right, withMultiplier: 1.21, relation: .greaterThanOrEqual
                )
                self.textField.clipsToBounds = true
            }
            return UIView.newAutoLayout()
        } else {
            checkbox?.removeFromSuperview()
            return rightView
        }
    }
}

extension HSSTextFieldAbstractView: TextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField(shouldChangeCharactersIn: range, replacementString: string) != false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.didBeginEditing()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didEndEditing(text: self.text)
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.shouldEndEditing() != false
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.shouldBeginEditing() != false
    }

    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool) {
        delegate?.textField(textField, didDeleteBackwardAnd: wasEmpty)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.shouldReturn() != false
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if #available(iOS 13, *) {
            delegate?.didChangeSelection(selectedRange: textField.selectedTextRange)
        }
    }
}

private extension UITextField {
    func setiOS11InputTraitsProperties(_ traits: UITextInputTraits) {
       if #available(iOS 11, *) {
           if let smartQuotesType = traits.smartQuotesType {
               self.smartQuotesType = smartQuotesType
           }
           if let smartDashesType = traits.smartDashesType {
               self.smartDashesType = smartDashesType
           }
           if let smartInsertDeleteType = traits.smartInsertDeleteType {
              self.smartInsertDeleteType = smartInsertDeleteType
          }
       }
    }

    func setiOS12InputTraitProperties(_ traits: UITextInputTraits) {
       if #available(iOS 12, *) {
           if let passwordRules = traits.passwordRules {
               self.passwordRules = passwordRules
           }
       }
    }

    func setInputTraits(_ traits: UITextInputTraits) {
       if let autocapitalizationType = traits.autocapitalizationType {
           self.autocapitalizationType = autocapitalizationType
       }
       if let autocorrectionType = traits.autocorrectionType {
           self.autocorrectionType = autocorrectionType
       }
       if let spellCheckingType = traits.spellCheckingType {
           self.spellCheckingType = spellCheckingType
       }
       if let enablesReturnKeyAutomatically = traits.enablesReturnKeyAutomatically {
           self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
       }
       if let isSecureTextEntry = traits.isSecureTextEntry {
           self.isSecureTextEntry = isSecureTextEntry
       }
       if let keyboardAppearance = traits.keyboardAppearance {
           self.keyboardAppearance = keyboardAppearance
       }
       if let keyboardType = traits.keyboardType {
           self.keyboardType = keyboardType
       }
       if let returnKeyType = traits.returnKeyType {
           self.returnKeyType = returnKeyType
       }
       if let textContentType = traits.textContentType {
           self.textContentType = textContentType
       }

       setiOS11InputTraitsProperties(traits)
       setiOS12InputTraitProperties(traits)
    }
}

