//
//  UserDefaultsStorable.swift
//  Common
//
//  Created by Dimitri Brukakis on 06.10.24.
//

import OSLog

@propertyWrapper public struct FileStorageStorable<T: Codable> {

    let fileStorage: FileStorage<T>
    public var wrappedValue: T? {
        get {
            try?fileStorage.load()
        }
        set {
            do {
                if let newValue {
                    try fileStorage.save(newValue)
                } else {
                    try fileStorage.delete()
                }
            } catch {
                // Nothing to handle, only don't crash
                os_log(.error, "Error saving file storage: %s", error.localizedDescription)
            }
        }
    }

    public init(fileName: String) {
        self.fileStorage = FileStorage<T>(fileName: fileName)
    }
}
