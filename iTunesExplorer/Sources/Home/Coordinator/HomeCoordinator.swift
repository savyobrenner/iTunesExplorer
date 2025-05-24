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
            viewModel: HomeViewModel(
                coordinator: self,
                homeRepository: Container.shared.homeRepository(),
                analytics: Container.shared.analytics(),
                reachability: Container.shared.networkMonitor()
            )
        )
            .insideHostingController()
        
        navigationController.setViewControllers([viewcontroller], animated: false)
    }
    
    enum Navigation {
        case details(album: AlbumItemResponse)
    }
    
    func navigate(to path: Navigation) {
        switch path {
        case let .details(album):
            let albumDetailsCoordinator = AlbumDetailsCoordinator(
                album: album,
                navigationController: self.navigationController
            )
            
            push(albumDetailsCoordinator, animated: true)
        }
    }
}
