//
//  HSSBodyBold.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

@objc
public class HSSBodyBold: NSObject {
    var startIndex: Int
    var endIndex: Int

    @objc public init(startIndex: Int, endIndex: Int) {
        self.startIndex = startIndex
        self.endIndex = endIndex
    }

    @objc public init(range: NSRange) {
        self.startIndex = range.lowerBound
        self.endIndex = range.upperBound
    }

    func isValidRange(_ text: NSAttributedString) -> Bool {
        return (startIndex >= 0 && endIndex >= 0 && startIndex <= endIndex && endIndex <= text.length)
    }
}

