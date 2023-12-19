//
//  HSSTextFieldAbstractView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

import Foundation
import AVFoundation
typealias HSSInputView = UIView & UITextInput

class HSSTextFieldAbstractView: UIView, HSSTextFieldView {

    @IBOutlet weak var fieldView: HSSInputView!
    @IBOutlet var view: UIView!

    @IBOutlet weak var labelLabel: UILabel!
    @IBOutlet weak var helperLabel: HSSLabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var helperIconImageView: UIImageView!
    @IBOutlet weak var helperLeadingToLabelLeading: NSLayoutConstraint!

    @IBOutlet private(set) var textFieldContainerStackView: UIStackView!
    @IBOutlet private(set) var textFieldContainer: UIView!
    var borderLayer: CAShapeLayer?
    var text: String = ""
    var attributeText: NSAttributedString?
    var customInputView: UIView?
    var customInputAccessoryView: UIView?
    var innerTextField: UITextField?
    weak var delegate: HSSTextFieldViewDelegate?

    var textInputView: UIView {
        get {
            fieldView
        }
    }

    var config: HSSTextFieldViewConfig

    override func accessibilityActivate() -> Bool {
        config.accessibilityActivated?()
        return true
    }

    init(withConfig config: HSSTextFieldViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = HSSTextFieldViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: HSSTextFieldViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(view)
        view.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()
        self.backgroundColor = .clear

        self.clipsToBounds = true
        self.fieldView.layer.borderWidth = 0
        self.fieldView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }

    /// Override this method on each Message View to setup its unique components
    func updateView() {
        if let icon = config.helperIcon, !icon.isEmpty {
            helperIconImageView.isHidden = false
            HSSIconsProvider.loadIcon(name: icon, placeItInto: helperIconImageView)
            helperIconImageView.backgroundColor = config.helperIconBgColor
            helperIconImageView.tintColor = config.helperIconColor
            helperLeadingToLabelLeading.priority = .defaultLow
            helperLeadingToLabelLeading.constant = 12
        } else {
            helperIconImageView.isHidden = true
            helperLeadingToLabelLeading.priority = .defaultHigh
            helperLeadingToLabelLeading.constant = 6
        }

        self.updateLabel(text: config.labelText, label: self.labelLabel, style: config.labelStyle)
        self.helperLabel.text = config.helperText

        let helperColor = config.helperIconBgColor ?? HSSLabelColor.secondary.color
        let bodyConfig = HSSLabelBodyConfig(bodySize: .bodyS,
                                              color: helperColor,
                                              bodyLinks: config.helperLinks,
                                              bodyBolds: config.helperBolds)
        self.helperLabel.setStyleAsBody(bodyConfig: bodyConfig)

        // update border
        updateBorder()
        textFieldContainer.backgroundColor = config.inputBgColor
        // set counter label with right count
        var counterTxt: String?
        if config.counter > 0 {
            let length = self.text.count
            counterTxt = "\(length) / \(config.counter)"
        }
        self.updateLabel(text: counterTxt, label: self.counterLabel, style: config.counterStyle)
        innerTextField?.isSecureTextEntry = config.isSecureTextEntry
    }

    private func updateLabel(text: String?, label: UILabel, style: HSSFontStyle) {
        guard let txt = text, !txt.isEmpty else {
            label.text = ""
            label.isHidden = true
            return
        }
        label.text = txt
        label.accessibilityLabel = txt
        label.isHidden = false
        label.setHSSStyle(style: style)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateBorder()
    }

    func updateBorder() {
        let dashed = self.config.textFieldBorderDashed
        let color = self.config.textFieldBorderColor
        let width = self.config.textFieldBorderWidth
        let radious = self.config.textFieldBorderRadious

        let bounds = textFieldContainer.bounds
        self.borderLayer?.removeFromSuperlayer()
        self.textFieldContainer.layer.cornerRadius = radious
        if dashed {
            self.borderLayer = HSSTextFieldBorderLayerDashed(color: color, bounds: bounds, width: width, radious: radious)
        } else {
            self.borderLayer = HSSTextFieldBorderLayerDefault(color: color, bounds: bounds, width: width, radious: radious)
        }
        if let borderLayer = self.borderLayer {
            self.textFieldContainer.layer.addSublayer(borderLayer)
        }
    }

    func clear() {
        self.text = ""
    }

    func checkLengthAndUpdateCounterLabel() {
        let maxLength = Int(config.counter)
        guard maxLength > 0 else { return } // dont check length if counter = 0

        if self.text.count > maxLength { // don't trim string if maxLength >= currentText length
            self.text = String(self.text.prefix(maxLength))
            DispatchQueue.main.async { [weak self] in // for some reason if you paste text that has to be trimmed the cursor doesn't move to the end of the text, this is a workaround for that case
                guard let fromRange = self?.fieldView.endOfDocument, let toRange = self?.fieldView.endOfDocument else { return }
                self?.fieldView.selectedTextRange = self?.fieldView.textRange(from: fromRange, to: toRange)
            }

        } else if self.text.count == maxLength {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        self.counterLabel.text = "\(self.text.count) / \(config.counter)"
    }

    override func resignFirstResponder() -> Bool {
        return fieldView.resignFirstResponder()
    }

    override func becomeFirstResponder() -> Bool {
        return fieldView.becomeFirstResponder()
    }

    override var isFirstResponder: Bool {
        return fieldView.isFirstResponder
    }
}

