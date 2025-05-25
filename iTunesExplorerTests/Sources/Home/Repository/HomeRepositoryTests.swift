//
//  HomeRepositoryTests.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import XCTest
@testable import iTunesExplorer

final class HomeRepositoryTests: XCTestCase {

    var repository: HomeRepository!
    var mockService: MockHomeServices!
    var mockCache: MockOfflineCacheManager!
    var mockReachability: MockNetworkReachability!

    override func setUp() {
        super.setUp()
        mockService = MockHomeServices()
        mockCache = MockOfflineCacheManager()
        mockReachability = MockNetworkReachability()
        repository = HomeRepository(service: mockService, cache: mockCache, reachability: mockReachability)
    }

    override func tearDown() {
        repository = nil
        mockService = nil
        mockCache = nil
        mockReachability = nil
        super.tearDown()
    }

    func test_fetchTopAlbums_online_success() async throws {
        mockReachability.isConnected = true
        mockService.shouldReturnError = false
        mockService.mockAlbums = [.mock]

        let result = try await repository.fetchTopAlbums(limit: 1, country: "us")

        XCTAssertEqual(result.count, 1)
        XCTAssertTrue(mockCache.didSave)
    }

    func test_fetchTopAlbums_online_serviceFails_usesCache() async throws {
        mockReachability.isConnected = true
        mockService.shouldReturnError = true
        mockCache.mockAlbums = [.mock]

        let result = try await repository.fetchTopAlbums(limit: 1, country: "us")

        XCTAssertEqual(result.count, 1)
    }

    func test_fetchTopAlbums_online_serviceFails_cacheEmpty_throws() async {
        mockReachability.isConnected = true
        mockService.shouldReturnError = true
        mockCache.mockAlbums = nil

        do {
            _ = try await repository.fetchTopAlbums(limit: 1, country: "us")
            XCTFail("Expected to throw")
        } catch {
            XCTAssertTrue(error is AppError)
        }
    }

    func test_fetchTopAlbums_offline_usesCache() async throws {
        mockReachability.isConnected = false
        mockCache.mockAlbums = [.mock]

        let result = try await repository.fetchTopAlbums(limit: 1, country: "us")

        XCTAssertEqual(result.count, 1)
    }

    func test_fetchTopAlbums_offline_cacheEmpty_throws() async {
        mockReachability.isConnected = false
        mockCache.mockAlbums = nil

        do {
            _ = try await repository.fetchTopAlbums(limit: 1, country: "us")
            XCTFail("Expected to throw")
        } catch {
            XCTAssertTrue(error is AppError)
        }
    }
}
