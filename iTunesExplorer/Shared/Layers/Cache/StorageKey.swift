//
//  StorageKey.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

public enum StorageKey: CaseIterable {
    case user
    case custom(String)

    public static var allCases: [StorageKey] {
        return [.user]
    }

    var key: String {
        switch self {
        case .user:
            return "user"
        case let .custom(key):
            return key
        }
    }
}
