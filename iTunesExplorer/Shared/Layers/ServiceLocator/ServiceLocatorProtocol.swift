//
//  ServiceLocatorProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

protocol ServiceLocatorProtocol {
    var network: NetworkProtocol { get }
    var cacheManager: CacheManagerProtocol { get }
    var userSettings: UserSettingsProtocol { get }
}

