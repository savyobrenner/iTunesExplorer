//
//  HomeEndpoint.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

enum HomeEndpoint {
    case topAlbums(limit: Int, country: String)
}

extension HomeEndpoint: Endpoint {
    var path: String {
        switch self {
        case let .topAlbums(limit, country):
            return "\(country)/rss/topalbums/limit=\(limit)/json"
        }
    }

    var request: HttpMethods {
        switch self {
        case .topAlbums:
            return .get
        }
    }
    
    var requestSpecificHeaders: [String: String] {
        switch self {
        case .topAlbums:
            return ["Content-Type": "application/json"]
        }
    }
    
    var queryParameters: [URLQueryItem] {
        return []
    }
    
    var bodyParameters: [String : Any]? {
        return nil
    }
}
