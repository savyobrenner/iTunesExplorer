//
//  HomeRepositoryProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

protocol HomeRepositoryProtocol {
    func fetchTopAlbums(limit: Int, country: String) async throws -> [AlbumItemResponse]
}
