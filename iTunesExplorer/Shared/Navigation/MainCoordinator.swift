//
//  MainCoordinator.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

class MainCoordinator: BaseCoordinator {
    override func start() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.parentCoordinator = self
        childCoordinators.append(splashCoordinator)
        
        splashCoordinator.start()
    }
}
