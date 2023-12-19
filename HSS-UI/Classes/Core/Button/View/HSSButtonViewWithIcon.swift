//
//  HSSButtonViewWithIcon.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal class HSSButtonViewWithIcon: HSSButtonAbstractView {

    @IBOutlet var icon: UIImageView!

    override internal func setupStyle() {
        super.setupStyle()

        icon.image = config.icon!.withRenderingMode(.alwaysTemplate)
        icon.highlightedImage = config.icon!.withRenderingMode(.alwaysTemplate)
        icon.tintColor = config.iconColor
    }

    override func disable() {
        super.disable()
        icon.tintColor = config.iconDisableColor
    }

    override func enable() {
        super.enable()
        icon.tintColor = config.iconColor
    }
}
