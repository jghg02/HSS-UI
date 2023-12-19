//
//  HSSButtonViewIconLeft.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal class HSSButtonViewIconLeft: HSSButtonViewWithIcon {

    override internal func loadNib() {
        let bundle = HSSBundle.bundle()
        bundle.loadNibNamed("HSSButtonViewIconLeft", owner: self, options: nil)
    }
}
