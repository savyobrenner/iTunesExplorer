//
//  MockOfflineCacheManager.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

final class MockOfflineCacheManager: OfflineCacheManagerProtocol {
    var didSave = false
    var mockAlbums: [AlbumItemResponse]?

    func save<T: Codable>(_ object: T, as fileName: String) {
        didSave = true
    }

    func load<T: Codable>(from fileName: String) -> T? {
        return mockAlbums as? T
    }
}
