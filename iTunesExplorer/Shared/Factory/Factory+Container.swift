//
//  Factory+Container.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Factory

extension Container {
    var networkService: Factory<NetworkProtocol> {
        self { NetworkClient() }
    }
    
    var cacheManager: Factory<CacheManagerProtocol> {
        self { CacheManager() }
    }
    
    var userSettings: Factory<UserSettingsProtocol> {
        self { UserSettings() }
    }
    
    var serviceLocator: Factory<ServiceLocatorProtocol> {
        self {
            ServiceLocator(
                network: self.networkService.resolve(),
                cacheManager: self.cacheManager.resolve(),
                userSettings: self.userSettings.resolve()
            )
        }.singleton
    }
    
    var analytics: Factory<AnalyticsCollectible> {
        self { SimulatedAnalytics() }.singleton
    }
    
    var homeServices: Factory<HomeServicesProtocol> {
        self { HomeServices(network: self.networkService()) }
    }
}

