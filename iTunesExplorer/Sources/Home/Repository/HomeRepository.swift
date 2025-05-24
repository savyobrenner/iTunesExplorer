//
//  HomeRepository.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

final class HomeRepository: HomeRepositoryProtocol {
    private let service: HomeServicesProtocol
    private let cache: OfflineCacheManagerProtocol
    private let cacheFileName = "top_albums_cache.json"
    private let reachability: NetworkReachabilityProtocol

    init(service: HomeServicesProtocol, cache: OfflineCacheManagerProtocol, reachability: NetworkReachabilityProtocol) {
        self.service = service
        self.cache = cache
        self.reachability = reachability
    }

    func fetchTopAlbums(limit: Int, country: String) async throws -> [AlbumItemResponse] {
        if reachability.isConnected {
            do {
                let response = try await service.fetchTopAlbums(limit: limit, country: country)
                cache.save(response.albums, as: cacheFileName)
                return response.albums
            } catch {
                guard let cached: [AlbumItemResponse] = cache.load(from: cacheFileName) else {
                    throw AppError.networkError
                }
                return cached
            }
        } else {
            guard let cached: [AlbumItemResponse] = cache.load(from: cacheFileName) else {
                throw AppError.networkError
            }
            return cached
        }
    }
}
