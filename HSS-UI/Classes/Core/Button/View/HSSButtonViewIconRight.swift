//
//  HSSButtonViewIconRight.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal class HSSButtonViewIconRight: HSSButtonViewWithIcon {

    override internal func loadNib() {
        let bundle = HSSBundle.bundle()
        bundle.loadNibNamed("HSSButtonViewIconLeft", owner: self, options: nil)
    }
}
