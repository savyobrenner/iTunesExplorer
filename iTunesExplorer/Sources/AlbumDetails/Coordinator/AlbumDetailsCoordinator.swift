//
//  AlbumDetailsCoordinator.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Factory
import SwiftUI

class AlbumDetailsCoordinator: BaseCoordinator {
    
    private let album: AlbumItemResponse
    
    init(album: AlbumItemResponse, navigationController: AppNavigationController) {
        self.album = album
        
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let viewcontroller = AlbumDetailsView(
            viewModel: AlbumDetailsViewModel(coordinator: self, album: album, analytics: Container.shared.analytics())
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
