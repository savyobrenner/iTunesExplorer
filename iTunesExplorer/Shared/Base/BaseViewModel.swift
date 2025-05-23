//
//  BaseViewModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

protocol BaseViewModelProtocol: ObservableObject {
    associatedtype CoordinatorType: BaseCoordinator
    var isLoading: Bool { get set }
    var coordinator: CoordinatorType? { get set }
    
    func dismiss(animated: Bool)
}

class BaseViewModel<CoordinatorType: BaseCoordinator>: BaseViewModelProtocol {
    @Published
    var isLoading = false
    
    var coordinator: CoordinatorType?

    // MARK: - Analytics parameters
    private var startTime: Date?
    var screenTime: Int {
        guard let startTime = startTime else { return 0 }
        return Int(Date().timeIntervalSince(startTime))
    }
    
    init(coordinator: CoordinatorType?) {
        self.startTime = Date()
        self.coordinator = coordinator
    }
    
    func dismiss(animated: Bool = true) {
        coordinator?.dismiss(animated: animated)
    }
    
    func handleNetworkError(_ error: Error) {
        
    }
}
