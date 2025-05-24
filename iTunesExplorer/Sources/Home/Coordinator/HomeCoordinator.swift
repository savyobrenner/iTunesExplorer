//
//  HomeCoordinator.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Factory
import SwiftUI

class HomeCoordinator: BaseCoordinator {
    
    override func start() {
        let viewcontroller = HomeView(
            viewModel: HomeViewModel(coordinator: self)
        )
            .insideHostingController()
        
        navigationController.setViewControllers([viewcontroller], animated: false)
    }
    
    enum Navigation {
        case home
    }
    
    func navigate(to path: Navigation) {
        switch path {
        case .home: break
        }
    }
}
