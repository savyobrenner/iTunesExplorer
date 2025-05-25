//
//  MockHomeRepository.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

final class MockHomeRepository: HomeRepositoryProtocol {
    var result: Result<[AlbumItemResponse], Error> = .success([.mock])

    func fetchTopAlbums(limit: Int, country: String) async throws -> [AlbumItemResponse] {
        try await Task.sleep(nanoseconds: 50_000_000)
        switch result {
        case .success(let albums): return albums
        case .failure(let error): throw error
        }
    }
}
