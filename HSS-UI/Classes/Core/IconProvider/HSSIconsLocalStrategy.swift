//
//  HSSIconsLocalStrategy.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

class HSSIconsLocalStrategy: HSSIconsStrategy {
    func loadIcon(name: String, success: (UIImage) -> Void, failure: ((Error?) -> Void)?) {
        let main = Bundle(for: HSSBundle.self)
        guard let bundlePath = main.resourceURL?.appendingPathComponent("HSSIcons.bundle"),
              let iconsBundle = Bundle(url: bundlePath),
              let icon = UIImage(named: name, in: iconsBundle, compatibleWith: nil) else {
            failure?(nil)
            return
        }

        success(icon)
    }
}
