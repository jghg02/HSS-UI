//
//  HSSCheckboxDefaultView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSCheckboxDefaultView: UIView, HSSCheckboxView {

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var labelToTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightBoxToTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftBoxToTopConstraint: NSLayoutConstraint!

    @IBOutlet weak var leftBox: UIImageView!
    @IBOutlet weak var rightBox: UIImageView!

    @IBOutlet weak var tappableArea: UIButton!

    @IBOutlet var checkboxView: UIView!

    weak var delegate: HSSCheckboxViewDelegate?

    var config: HSSCheckboxViewConfig

    init(withConfig config: HSSCheckboxViewConfig, delegate: HSSCheckboxViewDelegate) {
        self.config = config
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }

    func update(withConfig config: HSSCheckboxViewConfig) {
        self.config = config
        updateView()
    }

    @IBAction func checkboxTapped(_ sender: Any) {
        self.delegate?.checkboxTapped()
    }

    func loadNib() {
       let bundle = HSSBundle.bundle()
       bundle.loadNibNamed("HSSCheckboxDefaultView", owner: self, options: nil)
    }

    override init(frame: CGRect) {
        self.config = HSSCheckboxViewConfig()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = HSSCheckboxViewConfig()
        super.init(coder: coder)
        setup()
    }

    init() {
        self.config = HSSCheckboxViewConfig()
        super.init(frame: .zero)
        setup()
    }

    func setup() {
        loadNib()
        self.addSubview(checkboxView)
        checkboxView.pinToSuperview()
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        initialize()
        updateView()
    }

    func initialize() {
//        self.label.setHSSStyle(style: HSSStyleSheetManager.styleSheet.bodyM(color: config.textColor))
        self.label.isAccessibilityElement = false
    }

    func updateView() {
        clearView()
        self.label.text = config.title
        self.label.numberOfLines = config.titleNumberOfLines
        self.label.lineBreakMode = .byTruncatingTail
        self.label.setContentHuggingPriority(.required, for: .horizontal)
        self.label.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.label.setContentHuggingPriority(.required, for: .vertical)
        self.label.setContentCompressionResistancePriority(.required, for: .vertical)
        updateBoxesViews()
        updateBoxesBorders()
        updateIcons()
    }

    func updateIcons() {
        if let currentIcon = config.icon, !currentIcon.isEmpty {
            if let currentIconColor = config.iconColor {
                if self.leftBox.isHidden == false {
                    HSSIconsProvider.loadIcon(name: currentIcon) { checkboxIcon in
                        self.leftBox.image = checkboxIcon
                    }
                    self.leftBox.tintColor = currentIconColor
                } else {
                    HSSIconsProvider.loadIcon(name: currentIcon) { checkboxIcon in
                        self.rightBox.image = checkboxIcon
                    }
                    self.rightBox.tintColor = currentIconColor
                }
            }
        }
    }

    func updateBoxesViews() {
        let constraint = HSSCheckboxConstraintFactory.retrieveConstraints(align: config.align, context: config.context)

        if config.context == .textField {
            self.label.setContentCompressionResistancePriority(.required, for: .horizontal)
            self.label.setContentHuggingPriority(.required, for: .horizontal)
        }

        switch config.align {
        case .left:
            self.rightBox.isHidden = true
            self.leftBox.isHidden = false
            self.leftBox.backgroundColor = config.backgroundColor
            self.leftBox.layer.cornerRadius = config.cornerRadius

            // Avoids label and check overlapping
            self.labelToLeadingConstraint.constant = constraint.labelToLeadingConstraint
            // Adjust the leading label to show behind the hidden right check box
            self.labelToTrailingConstraint.constant = constraint.labelToTrailingConstraint

            // Align correctly the box to the fontSize (And not the lineHeight)
            self.rightBoxToTopConstraint.constant = 0
            if let isEmpty = label.text?.isEmpty, isEmpty {
                self.leftBoxToTopConstraint.constant = -self.labelToTopConstraint.constant
            } else {
                self.leftBoxToTopConstraint.constant = self.label.fontSpacing
            }

        case .right:
            self.rightBox.isHidden = false
            self.leftBox.isHidden = true
            self.rightBox.backgroundColor = config.backgroundColor
            self.rightBox.layer.cornerRadius = config.cornerRadius

            // Adjust the leading label to show behind the hidden left check box
            self.labelToLeadingConstraint.constant = constraint.labelToLeadingConstraint
            // Avoids label and check overlapping
            self.labelToTrailingConstraint.constant = constraint.labelToTrailingConstraint

            // Align correctly the box to the fontSize (And not the lineHeight)
            self.rightBoxToTopConstraint.constant = self.label.fontSpacing
            self.leftBoxToTopConstraint.constant = 0
        }
    }

    func updateBoxesBorders() {
        if let currentBorderColor = config.borderColor, let currentBorderSize = config.borderSize {
            if !self.leftBox.isHidden {
                self.leftBox.layer.borderColor = currentBorderColor.cgColor
                self.leftBox.layer.borderWidth = currentBorderSize
            } else {
                self.rightBox.layer.borderColor = currentBorderColor.cgColor
                self.rightBox.layer.borderWidth = currentBorderSize
            }
        }
    }

    func clearView() {
        self.leftBox.layer.borderColor = UIColor.clear.cgColor
        self.rightBox.layer.borderColor = UIColor.clear.cgColor
        self.leftBox.layer.borderWidth = 0
        self.rightBox.layer.borderWidth = 0
        self.leftBox.image = nil
        self.rightBox.image = nil
    }
}
