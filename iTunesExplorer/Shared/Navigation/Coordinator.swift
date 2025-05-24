//
//  Coordinator.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import UIKit
import SwiftUI

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: AppNavigationController { get set }

    func start()
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    func present(
        _ coordinator: Coordinator,
        modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
        modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
        animated: Bool = true,
        isModalInPresentation: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        
        coordinator.navigationController.modalPresentationStyle = modalPresentationStyle
        coordinator.navigationController.modalTransitionStyle = modalTransitionStyle
        coordinator.navigationController.isModalInPresentation = isModalInPresentation
        coordinator.start()
        
        navigationController.present(coordinator.navigationController, animated: animated, completion: completion)
    }
    
    func push(_ coordinator: Coordinator, animated: Bool = true) {
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        if navigationController.presentingViewController != nil {
            navigationController.dismiss(animated: animated) { [weak self] in
                self?.removeFromParent()
                completion?()
            }
        } else if navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
            removeFromParent()
            completion?()
        }
    }

    private func removeFromParent() {
        if let parentCoordinator = parentCoordinator {
            parentCoordinator.childCoordinators.removeAll { $0 === self }
        }
    }
}
