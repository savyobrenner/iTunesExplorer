//
//  SplashCoordinator.swift
//  LikeAPPro
//
//  Created by Savyo Brenner on 24/07/24.
//  Copyright © 2024 LikeAPPro Tecnologia. All rights reserved.
//

import Factory
import SwiftUI

class SplashCoordinator: BaseCoordinator {
    
    override func start() {
        let viewcontroller = SplashView(
            viewModel: SplashViewModel(coordinator: self, analytics: Container.shared.analytics())
        )
            .insideHostingController()
        
        navigationController.setViewControllers([viewcontroller], animated: false)
    }
    
    enum Navigation {
        case home
    }
    
    func navigate(to path: Navigation) {
        switch path {
        case .home:
            let homeCoordinator = HomeCoordinator(navigationController: navigationController)
            parentCoordinator?.childCoordinators.removeAll { $0 === self }
            parentCoordinator?.childCoordinators.append(homeCoordinator)
            
            homeCoordinator.start()
        }
    }
}
