//
//  ServiceLocator.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

final class ServiceLocator: ServiceLocatorProtocol {
    
    var network: NetworkProtocol
    var cacheManager: CacheManagerProtocol
    var userSettings: UserSettingsProtocol
    
    init(network: NetworkProtocol,
         cacheManager: CacheManagerProtocol,
         userSettings: UserSettingsProtocol) {
        self.network = network
        self.cacheManager = cacheManager
        self.userSettings = userSettings
    }
}

