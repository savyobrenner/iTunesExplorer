//
//  Endpoint.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

protocol Endpoint {
    var url: URL? { get }
    var host: String { get }
    var path: String { get }
    var requestSpecificHeaders: [String: String] { get }
    var request: HttpMethods { get }
    var queryParameters: [URLQueryItem] { get }
}

// MARK: - Default
extension Endpoint {
    var host: String { AppEnvironment.baseURL }

    var url: URL? {
        .init(string: "\(host)/\(path)/")
    }
}
