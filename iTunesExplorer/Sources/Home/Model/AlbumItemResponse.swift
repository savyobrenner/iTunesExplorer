//
//  AlbumItemResponse.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

struct AlbumItemResponse: Codable {
    let name: LabelContainer
    let images: [ImageResponse]
    let itemCount: LabelContainer
    let price: Price
    let title: LabelContainer
    let artist: Artist
    let category: Category
    let releaseDate: ReleaseDate

    private enum CodingKeys: String, CodingKey {
        case name = "im:name"
        case images = "im:image"
        case itemCount = "im:itemCount"
        case price = "im:price"
        case title
        case artist = "im:artist"
        case category
        case releaseDate = "im:releaseDate"
    }
}

// MARK: - Nested Models (Helper Structs)
extension AlbumItemResponse {
    struct LabelContainer: Codable {
        let label: String
    }
    
    struct ImageResponse: Codable {
        let label: URL
        let attributes: ImageAttributes
    }
    
    struct ImageAttributes: Codable {
        let height: String
    }
    
    struct Price: Codable {
        let label: String
        let attributes: PriceAttributes
    }
    
    struct PriceAttributes: Codable {
        let amount: String
        let currency: String
    }
    
    struct ContentTypeWrapper: Codable {
        let contentType: ContentType
        let attributes: ContentTypeAttributes
        
        private enum CodingKeys: String, CodingKey {
            case contentType = "im:contentType"
            case attributes
        }
    }
    
    struct ContentType: Codable {
        let attributes: ContentTypeAttributes
    }
    
    struct ContentTypeAttributes: Codable {
        let term: String
        let label: String
    }
    
    struct Link: Codable {
        let attributes: LinkAttributes
    }
    
    struct LinkAttributes: Codable {
        let rel: String
        let type: String
        let href: String
    }
    
    struct ID: Codable {
        let label: String
        let attributes: IDAttributes
    }
    
    struct IDAttributes: Codable {
        let imID: String
        
        private enum CodingKeys: String, CodingKey {
            case imID = "im:id"
        }
    }
    
    struct Artist: Codable {
        let label: String
        let attributes: ArtistAttributes?
    }
    
    struct ArtistAttributes: Codable {
        let href: URL
    }
    
    struct Category: Codable {
        let attributes: CategoryAttributes
    }
    
    struct CategoryAttributes: Codable {
        let id: String
        let term: String
        let scheme: String
        let label: String
        
        private enum CodingKeys: String, CodingKey {
            case id = "im:id"
            case term, scheme, label
        }
    }
    
    struct ReleaseDate: Codable {
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
