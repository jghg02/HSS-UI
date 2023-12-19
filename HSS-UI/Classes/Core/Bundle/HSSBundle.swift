//
//  HSSBundle.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

public class HSSBundle {
    public static func bundle() -> Bundle {
        if let path = Bundle(for: self).path(forResource: "HSS-UIResources", ofType: "bundle"),
            let bundle = Bundle(path: path) {
            return bundle
        }
        return Bundle.main
    }
}
