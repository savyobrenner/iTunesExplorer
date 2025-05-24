//
//  AlbumDetailsViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class AlbumDetailsViewModel: BaseViewModel<AlbumDetailsCoordinator>, AlbumDetailsViewModelProtocol {

    let album: AlbumItemResponse
    
    private let analytics: AnalyticsCollectible
    
    init(coordinator: AlbumDetailsCoordinator?, album: AlbumItemResponse, analytics: AnalyticsCollectible) {
        self.album = album
        self.analytics = analytics
        
        super.init(coordinator: coordinator)
    }
    
    override func dismiss(animated: Bool = true) {
        analytics.collect(event: AnalyticsEvents.albumDetailsScreenBackButton)
        
        super.dismiss(animated: animated)
    }
}
