//
//  AlbumItemResponse.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

struct AlbumItemResponse: Decodable {
    let name: LabelContainer
    let images: [ImageResponse]
    let itemCount: LabelContainer
    let price: Price
    let contentType: ContentTypeWrapper
    let rights: LabelContainer
    let title: LabelContainer
    let link: Link
    let id: ID
    let artist: Artist
    let category: Category
    let releaseDate: ReleaseDate

    private enum CodingKeys: String, CodingKey {
        case name = "im:name"
        case images = "im:image"
        case itemCount = "im:itemCount"
        case price = "im:price"
        case contentType = "im:contentType"
        case rights
        case title
        case link
        case id
        case artist = "im:artist"
        case category
        case releaseDate = "im:releaseDate"
    }
}

// MARK: - Nested Models (Helper Structs)
extension AlbumItemResponse {
    struct LabelContainer: Decodable {
        let label: String
    }
    
    struct ImageResponse: Decodable {
        let label: URL
        let attributes: ImageAttributes
    }
    
    struct ImageAttributes: Decodable {
        let height: String
    }
    
    struct Price: Decodable {
        let label: String
        let attributes: PriceAttributes
    }
    
    struct PriceAttributes: Decodable {
        let amount: String
        let currency: String
    }
    
    struct ContentTypeWrapper: Decodable {
        let contentType: ContentType
        let attributes: ContentTypeAttributes
        
        private enum CodingKeys: String, CodingKey {
            case contentType = "im:contentType"
            case attributes
        }
    }
    
    struct ContentType: Decodable {
        let attributes: ContentTypeAttributes
    }
    
    struct ContentTypeAttributes: Decodable {
        let term: String
        let label: String
    }
    
    struct Link: Decodable {
        let attributes: LinkAttributes
    }
    
    struct LinkAttributes: Decodable {
        let rel: String
        let type: String
        let href: String
    }
    
    struct ID: Decodable {
        let label: String
        let attributes: IDAttributes
    }
    
    struct IDAttributes: Decodable {
        let imID: String
        
        private enum CodingKeys: String, CodingKey {
            case imID = "im:id"
        }
    }
    
    struct Artist: Decodable {
        let label: String
        let attributes: ArtistAttributes?
    }
    
    struct ArtistAttributes: Decodable {
        let href: URL
    }
    
    struct Category: Decodable {
        let attributes: CategoryAttributes
    }
    
    struct CategoryAttributes: Decodable {
        let id: String
        let term: String
        let scheme: String
        let label: String
        
        private enum CodingKeys: String, CodingKey {
            case id = "im:id"
            case term, scheme, label
        }
    }
    
    struct ReleaseDate: Decodable {
        let label: String
        let attributes: LabelContainer
    }
}

// MARK: - Image Selection Utility
extension AlbumItemResponse {
    enum ImageSize {
        case small, medium, large
    }
    
    func imageURL(for size: ImageSize) -> URL? {
        let sorted = images.sorted { (Int($0.attributes.height) ?? 0) < (Int($1.attributes.height) ?? 0) }
        switch size {
        case .small: return sorted.first?.label
        case .medium: return sorted.count > 1 ? sorted[1].label : sorted.last?.label
        case .large: return sorted.last?.label
        }
    }
}
