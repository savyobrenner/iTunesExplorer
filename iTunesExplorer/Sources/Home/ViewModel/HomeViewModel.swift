//
//  HomeViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class HomeViewModel: BaseViewModel<HomeCoordinator>, HomeViewModelProtocol {
    
    @Published
    private(set) var albums: [AlbumItemResponse] = []
    
    @Published
    private(set) var isOnline = true {
        didSet {
            if isOnline {
                currentAlert = .init(type: .success, title: "online.message".localized, position: .bottom)
            } else {
                currentAlert = .init(type: .warning, title: "offline.message".localized, position: .bottom)
            }
        }
    }
    
    var title: String {
        "top.albums".localized
            .replacingOccurrences(of: "%d", with: "\(albumsQuantity)")
            .replacingOccurrences(of: "%@", with: userLocale.countryName)
    }
    
    private var userLocale: LocalizationHelper {
        LocalizationHelper.from(deviceLocale: .current)
    }
    
    private var albumsQuantity = 100
    
    private let homeRepository: HomeRepositoryProtocol
    private let analytics: AnalyticsCollectible
    private var reachability: NetworkReachabilityProtocol
    
    init(
        coordinator: HomeCoordinator?,
        homeRepository: HomeRepositoryProtocol,
        analytics: AnalyticsCollectible,
        reachability: NetworkReachabilityProtocol
    ) {
        self.homeRepository = homeRepository
        self.analytics = analytics
        self.reachability = reachability
        
        analytics.collect(event: AnalyticsEvents.homeScreen)
        
        super.init(coordinator: coordinator)
        
        startNetworkMonitoring()
    }
    
    func loadData() {
        isLoading = true
        
        if !isOnline {
            isOnline = reachability.isConnected
        }
        
        coordinator?.autoCancellingTask { @MainActor in
            defer { self.isLoading = false }
            
            do {
                let response = try await self.homeRepository.fetchTopAlbums(
                    limit: self.albumsQuantity, country: self.userLocale.iTunesCountryCode
                )
                
                self.albums = response
            } catch {
                HapticFeedbackGenerator.error()
                
                self.handleNetworkError(error)
            }
        }
    }
    
    func openDetails(for album: AlbumItemResponse) {
        analytics.collect(event: AnalyticsEvents.homeScreenSelectAlbum(name: album.name.label))
        
        HapticFeedbackGenerator.selection()
        
        coordinator?.navigate(to: .details(album: album))
    }
    
    private func startNetworkMonitoring() {
        self.reachability.onStatusChange = { [weak self] status in
            DispatchQueue.main.async {
                self?.isOnline = status
            }
        }
    }
}
