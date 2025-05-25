//
//  OfflineCacheManagerProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

protocol OfflineCacheManagerProtocol {
    func save<T: Codable>(_ object: T, as fileName: String)
    func load<T: Codable>(from fileName: String) -> T?
}
