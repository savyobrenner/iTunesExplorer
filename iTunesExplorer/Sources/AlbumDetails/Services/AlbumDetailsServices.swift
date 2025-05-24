//
//  AlbumDetailsServices.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

final class AlbumDetailsServices: AlbumDetailsServicesProtocol {

    private let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }
}
