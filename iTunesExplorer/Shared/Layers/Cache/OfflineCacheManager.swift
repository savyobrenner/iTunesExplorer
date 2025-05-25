//
//  OfflineCacheManager.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

final class OfflineCacheManager: OfflineCacheManagerProtocol {
    
    func save<T: Codable>(_ object: T, as fileName: String) {
        let url = getURL(for: fileName)
        guard let data = try? JSONEncoder().encode(object) else { return }
        try? data.write(to: url, options: [.atomic])
    }

    func load<T: Codable>(from fileName: String) -> T? {
        let url = getURL(for: fileName)
        guard let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    private func getURL(for fileName: String) -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }
}
