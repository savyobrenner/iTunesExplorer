//
//  UserDefaultsStorage.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

final class UserDefaultsStorage {
    let defaults: UserDefaults

    init() {
        if let bundleID = Bundle.main.bundleIdentifier {
            defaults = UserDefaults(suiteName: bundleID) ?? .standard
        } else {
            defaults = .standard
        }
    }
}

extension UserDefaultsStorage: WritableStorage {
    func save<T>(value: T, for key: StorageKey) throws where T: Codable {
        defaults.set(value.encode(), forKey: key.key)
    }
    
    func save<T>(value: T, for key: String) throws where T : Decodable, T : Encodable {
        defaults.set(value.encode(), forKey: key)
    }
    
    func remove<T>(type: T.Type, for key: StorageKey) throws where T: Codable {
        defaults.removeObject(forKey: key.key)
    }
    
    func remove<T>(type: T.Type, for key: String) throws where T : Decodable, T : Encodable {
        defaults.removeObject(forKey: key)
    }
}

extension UserDefaultsStorage: ReadableStorage {
    func fetchValue<T>(for key: StorageKey) throws -> T where T: Codable {
        guard let value = defaults.data(forKey: key.key)?.decode(T.self) else { throw StorageError.notFound }
        return value
    }
    
    func fetchValue<T>(for key: String) throws -> T where T : Decodable, T : Encodable {
        guard let value = defaults.data(forKey: key)?.decode(T.self) else { throw StorageError.notFound }
        return value
    }
}


