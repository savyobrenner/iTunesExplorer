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
    var currentAlert: FloatingAlertModel? { get set }
    
    func dismiss(animated: Bool)
}

class BaseViewModel<CoordinatorType: BaseCoordinator>: BaseViewModelProtocol {
    @Published
    var isLoading = false
    
    weak var coordinator: CoordinatorType?
    
    // MARK: - Alert parameters
    @Published
    var currentAlert: FloatingAlertModel?
    
    init(coordinator: CoordinatorType?) {
        self.coordinator = coordinator
    }
    
    func dismiss(animated: Bool = true) {
        coordinator?.dismiss(animated: animated)
    }
    
    func handleNetworkError(_ error: Error) {
        guard let error = error as? AppError, let message = error.message else {
            showAlert(message: error.localizedDescription)
            return
        }
        
        showAlert(message: message)
    }
    
    func showAlert(
        message: String,
        type: FloatingAlertType = .error,
        position: FloatingAlertModel.AlertPosition = .bottom
    ) {
        currentAlert = FloatingAlertModel(type: type, title: message, position: position)
    }
}
