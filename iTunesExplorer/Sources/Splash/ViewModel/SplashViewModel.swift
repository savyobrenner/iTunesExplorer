//
//  SplashViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

class SplashViewModel: BaseViewModel<SplashCoordinator>, SplashViewModelProtocol {
    
    private let analytics: AnalyticsCollectible
    
    init(coordinator: SplashCoordinator?, analytics: AnalyticsCollectible) {
        self.analytics = analytics
        
        super.init(coordinator: coordinator)
    }
    
    func load() {
        analytics.collect(event: AnalyticsEvents.appLaunch)
        
        coordinator?.navigate(to: .home)
    }
}
