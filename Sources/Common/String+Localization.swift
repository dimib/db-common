//
//  File.swift
//  Common
//
//  Created by Dimitri Brukakis on 20.10.24.
//

import Foundation

public extension String {
    static func localized(_ string: String) -> String {
        NSLocalizedString(string, comment: "")
    }

    static func localized(_ format: String, args: String...) -> String {
        let localizedString = localized(format)
        return String.init(format: localizedString, args)
    }
}
