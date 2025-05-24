//
//  HomeServicesProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

protocol HomeServicesProtocol {
    func fetchTopAlbums(limit: Int, country: String) async throws -> String
}
