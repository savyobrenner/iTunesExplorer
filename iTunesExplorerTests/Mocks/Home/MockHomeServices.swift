//
//  MockHomeServices.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

final class MockHomeServices: HomeServicesProtocol {
    var shouldReturnError = false
    var mockAlbums: [AlbumItemResponse] = []

    func fetchTopAlbums(limit: Int, country: String) async throws -> AlbumsResponse {
        if shouldReturnError {
            throw AppError.networkError
        } else {
            return AlbumsResponse(albums: mockAlbums)
        }
    }
}
