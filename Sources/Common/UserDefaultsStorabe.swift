//
//  UserDefaultsPropertyWrapper.swift
//  Instapunk
//
//  Created by Dimitri Brukakis on 25.08.24.
//

import Foundation

@propertyWrapper public struct UserDefaultsStorable<Value> {
    let key: String
    let storage: UserDefaults

    public var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set {
            if let newValue {
                storage.setValue(newValue, forKey: key)
            } else {
                storage.removeObject(forKey: key)
            }
        }
    }

    public init(key: String, storage: UserDefaults) {
        self.key = key
        self.storage = storage
    }
}
