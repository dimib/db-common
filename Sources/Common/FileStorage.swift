//
//  FileStorage.swift
//  UndergroundPublisher
//
//  Created by Dimitri Brukakis on 06.10.24.
//

import Foundation

public final class FileStorage<T: Codable> {
    private let fileManager: FileManager
    private let fileUrl: URL

    public init(fileManager: FileManager = .default, fileName: String,
                in directory: FileManager.SearchPathDirectory = .applicationSupportDirectory) {
        self.fileManager = fileManager
        let directory = fileManager.urls(for: directory, in: .userDomainMask).first!
        FileStorage.createIfNeeded(directory)
        self.fileUrl = directory.appendingPathComponent(fileName)
    }

    public func save(_ value: T) throws {
        let data = try JSONEncoder().encode(value)
        try data.write(to: fileUrl)
    }

    public func load() throws -> T {
        let data = try Data(contentsOf: fileUrl)
        return try JSONDecoder().decode(T.self, from: data)
    }

    public func delete() throws {
        try fileManager.removeItem(at: fileUrl)
    }

    private static func createIfNeeded(_ directory: URL, fileManager: FileManager = .default) {
        do {
            if !fileManager.fileExists(atPath: directory.absoluteString) {
                try fileManager.createDirectory(at: directory, withIntermediateDirectories: true)
            }
        } catch {
            debugPrint("☠️ createIfNeeded: \(error)")
        }
    }
}
