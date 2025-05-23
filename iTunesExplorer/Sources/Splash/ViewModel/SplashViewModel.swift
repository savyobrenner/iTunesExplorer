//
//  SplashViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

class SplashViewModel: BaseViewModel<SplashCoordinator>, SplashViewModelProtocol {
    
    private var user: String? {
        serviceLocator.userSettings.user
    }
    
    let serviceLocator: ServiceLocatorProtocol
    
    init(coordinator: SplashCoordinator?, serviceLocator: ServiceLocatorProtocol) {
        self.serviceLocator = serviceLocator
        
        super.init(coordinator: coordinator)
    }
    
    func load() {

    }
}
