//
//  MockNetworkClient.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

final class MockNetworkClient: NetworkProtocol {
    var shouldThrowError = false
    var mockResponse: Any?

    func sendRequest<Response: Decodable>(
        endpoint: Endpoint,
        responseModel: Response.Type
    ) async throws -> Response {
        if shouldThrowError {
            throw AppError.networkError
        }

        guard let response = mockResponse as? Response else {
            throw AppError.invalidResponse
        }

        return response
    }
}
