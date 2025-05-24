//
//  NetworkClient.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

final class NetworkClient: NetworkProtocol {
    private let urlSession: URLSession
    
    init(session: URLSession = .shared) {
        self.urlSession = session
    }
    
    func sendRequest<Response: Decodable>(
        endpoint: Endpoint,
        responseModel: Response.Type
    ) async throws -> Response {
        do {
            let request = try prepareRequest(for: endpoint)
            
            let (data, response) = try await urlSession.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw AppError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw AppError.networkError
            }

            do {
                let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                return decodedResponse
            } catch {
                throw AppError.invalidResponse
            }
        } catch let appError as AppError {
            throw appError
        } catch {
            throw AppError.unknownError
        }
    }
    
    private func prepareRequest(for endpoint: Endpoint) throws -> URLRequest {
        guard let url = endpoint.url else {
            throw AppError.unknownError
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = endpoint.queryParameters.isEmpty ? nil : endpoint.queryParameters
        
        guard let finalURL = components?.url else {
            throw AppError.unknownError
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = endpoint.request.methodName
        endpoint.requestSpecificHeaders.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        
        return request
    }
}
