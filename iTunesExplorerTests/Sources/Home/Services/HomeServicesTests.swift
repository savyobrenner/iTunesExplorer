//
//  HomeServicesTests.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import XCTest
@testable import iTunesExplorer

final class HomeServicesTests: XCTestCase {
    private var mockClient: MockNetworkClient!
    private var homeServices: HomeServices!

    override func setUp() {
        super.setUp()
        mockClient = MockNetworkClient()
        homeServices = HomeServices(network: mockClient)
    }

    func test_fetchTopAlbums_success() async throws {
        let mockAlbum = AlbumItemResponse.mock
        mockClient.mockResponse = AlbumsResponse(albums: [mockAlbum])

        let result = try await homeServices.fetchTopAlbums(limit: 1, country: "us")

        XCTAssertEqual(result.albums.count, 1)
        XCTAssertEqual(result.albums.first?.name.label, mockAlbum.name.label)
    }

    func test_fetchTopAlbums_failure() async {
        mockClient.shouldThrowError = true

        do {
            _ = try await homeServices.fetchTopAlbums(limit: 1, country: "us")
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertEqual(error as? AppError, .networkError)
        }
    }
}
