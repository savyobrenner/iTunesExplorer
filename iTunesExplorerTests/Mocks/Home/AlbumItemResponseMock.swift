//
//  AlbumItemResponseMock.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

extension AlbumItemResponse {
    static var mock: AlbumItemResponse {
        .init(
            name: .init(label: "Test Album"),
            images: [],
            itemCount: .init(label: "10"),
            price: .init(label: "$9.99", attributes: .init(amount: "9.99", currency: "USD")),
            title: .init(label: "Test Album Title"),
            artist: .init(label: "Test Artist", attributes: nil),
            category: .init(attributes: .init(id: "1", term: "Pop", scheme: "", label: "Pop")),
            releaseDate: .init(label: "2025-01-01", attributes: .init(label: "January 1, 2025"))
        )
    }
}
