//
//  HSSBodyLinks.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

@objc
public class HSSBodyLinks: NSObject {
    var links: [HSSBodyLink]
    var listener: ((_ index: Int) -> Void)

    public init(links: [HSSBodyLink], listener: @escaping ((_ index: Int) -> Void)) {
        self.links = links
        self.listener = listener
    }

    @objc public init(links: NSArray, listener: @escaping ((_ index: Int) -> Void)) {
        self.links = links as? [HSSBodyLink] ?? []
        self.listener = listener
    }
}
