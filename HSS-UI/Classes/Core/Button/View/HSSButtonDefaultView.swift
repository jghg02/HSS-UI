//
//  HSSButtonDefaultView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal class HSSButtonViewDefault: HSSButtonAbstractView {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!

    override internal func loadNib() {
        let bundle = HSSBundle.bundle()
        bundle.loadNibNamed("HSSButtonViewDefault", owner: self, options: nil)
    }

    override internal func setupSize() {
        super.setupSize()

        heightConstraint.constant = config.height
        leadingConstraint.constant = config.padding
        trailingConstraint.constant = config.padding
    }

}
