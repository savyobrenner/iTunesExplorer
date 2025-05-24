//
//  AlbumDetailsViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class AlbumDetailsViewModel: BaseViewModel<AlbumDetailsCoordinator>, AlbumDetailsViewModelProtocol {

    @Published
    private(set) var isOnline = true
        
    let album: AlbumItemResponse
    
    var price: String {
        "price".localized
            .replacingOccurrences(of: "%@", with: "\(album.price.label)")
    }
    
    var trackCount: String {
        "tracks_count".localized
            .replacingOccurrences(of: "%@", with: "\(album.itemCount.label)")
    }
    
    private let analytics: AnalyticsCollectible
    private var reachability: NetworkReachabilityProtocol
    
    init(
        coordinator: AlbumDetailsCoordinator?,
        album: AlbumItemResponse,
        analytics: AnalyticsCollectible,
        reachability: NetworkReachabilityProtocol
    ) {
        self.album = album
        self.analytics = analytics
        self.reachability = reachability
        
        analytics.collect(event: AnalyticsEvents.albumDetailsScreen)
        
        super.init(coordinator: coordinator)
        
        isOnline = reachability.isConnected
        startNetworkMonitoring()
    }
    
    override func dismiss(animated: Bool = true) {
        analytics.collect(event: AnalyticsEvents.albumDetailsScreenBackButton)
        
        HapticFeedbackGenerator.selection()
        
        super.dismiss(animated: animated)
    }
    
    private func startNetworkMonitoring() {
        self.reachability.onStatusChange = { [weak self] status in
            DispatchQueue.main.async {
                self?.isOnline = status
            }
        }
    }
}
