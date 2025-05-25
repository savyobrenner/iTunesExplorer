//
//  NetworkProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

protocol NetworkProtocol {
    func sendRequest<Response: Decodable>(
        endpoint: Endpoint,
        responseModel: Response.Type
    ) async throws -> Response
}
