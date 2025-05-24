//
//  HomeServices.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

final class HomeServices: HomeServicesProtocol {

    private let network: NetworkClient

    init(network: NetworkClient) {
        self.network = network
    }
}
