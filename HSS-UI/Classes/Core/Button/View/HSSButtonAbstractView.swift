//
//  HSSButtonAbstractView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation
import UIKit

internal class HSSButtonAbstractView: UIControl, HSSButtonView {

    internal var config: HSSButtonViewConfig
    internal var backgroundLayer: CALayer

    @IBOutlet var buttonView: UIView!
    @IBOutlet var label: UILabel!

    override public var frame: CGRect {
        didSet {
               buttonView?.frame = frame
           }
    }

    internal enum SpinnerState {
        case enabled
        case disabled

        mutating func changeState() {
            switch self {
            case .enabled:
                self = .disabled
            case .disabled:
                self = .enabled
            }
        }
    }

    private var spinnerState: SpinnerState = .disabled {
        didSet {
            self.updateSpinnerState()
        }
    }

    private let spinnerTransitionDuration: TimeInterval = 0.2
    private let spinnerTransitionPosition: CGFloat = 36

//    lazy var spinner: HSSProgressIndicatorIndeterminate = {
//        let color = config.spinnerTintColor
//        let size = config.spinnerSize
//        let spinner = HSSProgressIndicatorIndeterminate(size: size, tint: color)
//        addSubview(spinner)
//        spinner.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            spinner.topAnchor.constraint(equalTo: topAnchor),
//            spinner.trailingAnchor.constraint(equalTo: trailingAnchor),
//            spinner.leadingAnchor.constraint(equalTo: leadingAnchor),
//            spinner.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//        return spinner
//    }()

    var contentView: UIView {
        return buttonView.subviews.first ?? label
    }

    internal func startSpinnerAnimation() {
        guard spinnerState != .enabled else { return }
        spinnerState.changeState()
    }

    internal func stopSpinnerAnimation() {
        guard spinnerState != .disabled else { return }
        spinnerState.changeState()
    }

    internal init(config: HSSButtonViewConfig) {
        self.config = config
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        self.config = HSSButtonViewConfigFactory.provide(hierarchy: .loud, size: .large, text: "Label", icon: nil)
        self.backgroundLayer = CALayer()
        super.init(coder: coder)
        
        self.translatesAutoresizingMaskIntoConstraints = false

        setup()
    }

    private func setup() {
        loadNib()

        backgroundLayer = buttonView.layer
        addSubview(buttonView)

        setupSize()
        setupStyle()
        setText(config.text)
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    internal func setupStyle() {
        backgroundLayer.backgroundColor = config.backgroundColor
        label.textColor = config.textColor
    }

    internal func setupSize() {
        backgroundLayer.cornerRadius = config.cornerRadius
    }

    func enable() {
        setupStyle()
    }

    func disable() {
        backgroundLayer.backgroundColor = config.disableColor
        label.textColor = config.textDisableColor
    }

    func touchUp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundLayer.backgroundColor = self.config.backgroundColor
        }, completion: nil)
    }

    func touchDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundLayer.backgroundColor = self.config.pressedColor
        }, completion: nil)
    }

    func setText(_ text: String) {

        let attributes: [NSAttributedString.Key: Any] = [
            .font: config.font,
            .paragraphStyle: AndesButtonHelper.provideParagraphStyle()
        ]
        let attributedString = NSMutableAttributedString.init(string: text, attributes: attributes)
        let strRange = NSRange(location: 0, length: (text as NSString).length)
        attributedString.addAttributes(attributes, range: strRange)
        for attr in config.textAttributes {
            attributedString.addAttribute(attr.key, value: attr.value, range: strRange)
        }
        label.attributedText = attributedString
    }
}

internal class AndesButtonHelper {

    public static func provideParagraphStyle() -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byTruncatingTail

        return paragraphStyle
    }
}

// MARK: - Spinner methods
extension HSSButtonAbstractView {

    private func updateSpinnerState() {
        switch spinnerState {
        case .enabled:
           showSpinner()
        case .disabled:
            hideSpinner()
        }
    }

    private func showSpinner() {
        appearSpinnerAnimation()
    }

    private func hideSpinner() {
        dissapearSpinnerAnimation()
    }

    private func appearSpinnerAnimation() {
        self.clipsToBounds = true
        contentView.alpha = 1
        contentView.transform = CGAffineTransform(translationX: 0, y: 0)

        UIView.animate(
            withDuration: spinnerTransitionDuration,
            delay: 0, options: [.curveEaseIn],
            animations: {
                self.contentView.transform = CGAffineTransform(translationX: 0, y: -self.spinnerTransitionPosition)
                self.contentView.alpha = 0
        })
    }

    private func dissapearSpinnerAnimation(completion: (() -> Void)? = nil) {
        self.clipsToBounds = true
        contentView.alpha = 0
        contentView.transform = CGAffineTransform(translationX: 0, y: self.spinnerTransitionPosition)

        UIView.animate(
            withDuration: spinnerTransitionDuration,
            delay: 0,
            options: [.curveEaseIn],
            animations: {
                self.contentView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.contentView.alpha = 1
        }) { (_) in
            completion?()
        }
    }
}
