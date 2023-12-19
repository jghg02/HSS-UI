//
//  HSSBodyLink.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

@objc
public class HSSBodyLink: NSObject {
    var startIndex: Int
    var endIndex: Int

    @objc public init(startIndex: Int, endIndex: Int) {
        self.startIndex = startIndex
        self.endIndex = endIndex
    }

    func isValidRange(_ text: NSAttributedString) -> Bool {
        return (startIndex >= 0 && endIndex >= 0 && startIndex <= endIndex && endIndex <= text.length)
    }
}
