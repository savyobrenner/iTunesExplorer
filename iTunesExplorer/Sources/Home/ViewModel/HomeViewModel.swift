//
//  HomeViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class HomeViewModel: BaseViewModel<HomeCoordinator>, HomeViewModelProtocol {
    
    @Published
    var albums: [AlbumItemResponse] = []
    
    private var albumsLimits = 100
    
    private let homeServices: HomeServicesProtocol
    private let analytics: AnalyticsCollectible
    
    init(coordinator: HomeCoordinator?, homeServices: HomeServicesProtocol, analytics: AnalyticsCollectible) {
        self.homeServices = homeServices
        self.analytics = analytics
        
        analytics.collect(event: AnalyticsEvents.homeScreen)
        
        super.init(coordinator: coordinator)
    }
    
    func loadData() {
        isLoading = true
        
        coordinator?.autoCancellingTask { @MainActor in
            defer { self.isLoading = false }
            
            do {
                let country = "br"//LocalizationHelper.from(deviceLocale: .current).iTunesCountryCode
                let response = try await self.homeServices.fetchTopAlbums(limit: self.albumsLimits, country: country)
                
                self.albums = response.albums
            } catch {
                self.handleNetworkError(error)
            }
        }
    }
    
    func openDetails(for album: AlbumItemResponse) {
        analytics.collect(event: AnalyticsEvents.homeScreenSelectAlbum(name: album.name.label))
        
        coordinator?.navigate(to: .details(album: album))
    }
}
