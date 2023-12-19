//
//  HSSStringsLocalizableExtensions.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation

extension String {

    /// Localize the string using itself as a key
    func localized() -> String {
        return HSSBundle.bundle().localizedString(forKey: self, value: self, table: "HSSUILocalizable")
    }

    func localizeWithFormat(arguments: CVarArg...) -> String {
        return String(format: self.localized(), arguments: arguments)
    }
}
