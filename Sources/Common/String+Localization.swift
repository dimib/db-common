//
//  File.swift
//  Common
//
//  Created by Dimitri Brukakis on 20.10.24.
//

import Foundation

public extension String {

    init(l18n key: String) {
        self = NSLocalizedString(key, comment: "")
    }

    init(l18n key: String, args: CVarArg...) {
        let localizedString = NSLocalizedString(key, comment: "")
        self = String.init(format: localizedString, args)
    }
}
