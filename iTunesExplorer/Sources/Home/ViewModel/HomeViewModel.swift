//
//  HomeViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

class HomeViewModel: BaseViewModel<HomeCoordinator>, HomeViewModelProtocol {
    
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
                let response = try await self.homeServices.fetchTopAlbums(limit: 100, country: "us")
                
                print(response)
            } catch {
                self.handleNetworkError(error)
            }
        }
    }
}
