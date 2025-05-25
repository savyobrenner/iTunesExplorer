//
//  AlbumsResponse.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

extension AlbumsResponse {
    static var mock: AlbumsResponse {
        AlbumsResponse(albums: [.mock])
    }
}
