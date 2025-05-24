//
//  CachedImageView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct CachedImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
            case .failure(_), .empty:
                placeholder
            @unknown default:
                placeholder
            }
        }
    }

    private var placeholder: some View {
        Image(.imagePlaceholder)
    }
}

