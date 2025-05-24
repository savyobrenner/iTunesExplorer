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


#if DEBUG

/// Preview-only: Using force unwrap for clarity since the URL is static and this is not shipped to production.
#Preview {
    CachedImageView(url: .init(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!)
        .frame(width: 100, height: 100)
}

#endif
