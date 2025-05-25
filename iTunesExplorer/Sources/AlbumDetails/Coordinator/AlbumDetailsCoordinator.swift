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
            viewModel: AlbumDetailsViewModel(
                coordinator: self,
                album: album,
                analytics: Container.shared.analytics(),
                reachability: Container.shared.networkMonitor()
            )
        )
            .insideHostingController()
        
        navigationController.pushViewController(viewcontroller, animated: true)
    }
}
