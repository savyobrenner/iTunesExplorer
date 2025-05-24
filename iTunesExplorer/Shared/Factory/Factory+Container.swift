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
    
    var analytics: Factory<AnalyticsCollectible> {
        self { SimulatedAnalytics() }.singleton
    }
    
    var offlineCacheManager: Factory<OfflineCacheManagerProtocol> {
        self { OfflineCacheManager() }
    }
    
    var networkMonitor: Factory<NetworkReachabilityProtocol> {
        self { NetworkMonitor() }.singleton
    }
    
    var homeServices: Factory<HomeServicesProtocol> {
        self { HomeServices(network: self.networkService()) }
    }
    
    var homeRepository: Factory<HomeRepositoryProtocol> {
        self {
            HomeRepository(
                service: self.homeServices(),
                cache: self.offlineCacheManager(),
                reachability: self.networkMonitor()
            )
        }
    }
}

