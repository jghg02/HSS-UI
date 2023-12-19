//
//  HSSBodyBolds.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

@objc
public class HSSBodyBolds: NSObject {
    var bolds: [HSSBodyBold]

    public init(bolds: [HSSBodyBold]) {
        self.bolds = bolds
    }

    @objc public init(bolds: NSArray) {
        self.bolds = bolds as? [HSSBodyBold] ?? []

    }
}
