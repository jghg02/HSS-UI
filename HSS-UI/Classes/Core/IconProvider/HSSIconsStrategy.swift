//
//  HSSIconsStrategy.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc public protocol HSSIconsStrategy {
    /// Provides an icon retrieved from Images.xcassets, if not found, calls failure with nil
    /// - Parameters:
    ///   - name: icon name
    ///   - success: called if icon found
    ///   - failure: called if icon not found or error occured
    func loadIcon(name: String, success: (UIImage) -> Void, failure: ((Error?) -> Void)?)
}
