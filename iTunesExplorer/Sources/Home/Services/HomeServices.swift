//
//  HomeServices.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

final class HomeServices: HomeServicesProtocol {
    
    private let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func fetchTopAlbums(limit: Int, country: String) async throws -> AlbumResponse {
        let response = try await network.sendRequest(
            endpoint: HomeEndpoint.topAlbums(limit: limit, country: country),
            responseModel: AlbumResponse.self
        )

        return response
    }
}
