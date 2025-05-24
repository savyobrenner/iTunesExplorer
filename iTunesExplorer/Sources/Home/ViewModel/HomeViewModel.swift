//
//  HomeViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class HomeViewModel: BaseViewModel<HomeCoordinator>, HomeViewModelProtocol {
    
    private var albumsLimits = 100
    private let homeServices: HomeServicesProtocol
    
    init(coordinator: HomeCoordinator?, homeServices: HomeServicesProtocol) {
        self.homeServices = homeServices
        
        super.init(coordinator: coordinator)
    }
    
    func loadData() {
        isLoading = true
        
        coordinator?.autoCancellingTask { @MainActor in
            defer { self.isLoading = false }
            
            do {
                let country = LocalizationHelper.from(deviceLocale: .current).iTunesCountryCode
                let response = try await self.homeServices.fetchTopAlbums(limit: self.albumsLimits, country: country)
                
                print(response)
            } catch {
                self.handleNetworkError(error)
            }
        }
    }
}
