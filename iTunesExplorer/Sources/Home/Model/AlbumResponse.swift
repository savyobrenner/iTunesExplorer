//
//  AlbumResponse.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

struct AlbumsResponse: Decodable {
    let albums: [AlbumItemResponse]

    enum CodingKeys: String, CodingKey {
        case feed
    }

    enum FeedKeys: String, CodingKey {
        case albums = "entry"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let feedContainer = try container.nestedContainer(keyedBy: FeedKeys.self, forKey: .feed)
        albums = try feedContainer.decode([AlbumItemResponse].self, forKey: .albums)
    }
    
    init(albums: [AlbumItemResponse]) {
        self.albums = albums
    }
}
