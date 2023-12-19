//
//  HSSEnumStringConvertible.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

public protocol HSSEnumStringConvertible: CaseIterable {
    static func keyFor(_ value: Self) -> String
    var rawValue: Int { get }
    func toString() -> String
    static var allKeys: [String] { get }

    init?(from string: String)
}

public extension HSSEnumStringConvertible {
    static var allKeys: [String] {
        return Self.allCases.map({Self.keyFor($0)})
    }

    func toString() -> String {
        return Self.keyFor(self)
    }

    init?(from string: String) {
        guard let value = Self.allCases.first(where: { Self.keyFor($0).uppercased() == string.uppercased() }) else {
            return nil
        }
        self = value
    }
}

internal extension HSSEnumStringConvertible {
    @discardableResult static func checkValidEnum(property: String, key: String) -> Self {
        guard let value = Self.init(from: key) else {
            fatalError("\(key) is not valid, available values for \(property) are \(Self.allKeys)")
        }
        return value
    }
}
