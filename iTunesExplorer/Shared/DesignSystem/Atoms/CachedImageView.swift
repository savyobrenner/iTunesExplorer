//
//  CachedImageView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Kingfisher
import SwiftUI

struct CachedImageView<Placeholder: View>: View {
    
    let url: URL?
    
    @ViewBuilder
    let placeholder: () -> Placeholder
    
    @State
    private var didFail = false
    
    var body: some View {
        if didFail {
            Image(.teyaImagePlaceholder)
                .resizable()
                .scaledToFit()
        } else {
            KFImage(url)
                .cacheOriginalImage()
                .placeholder { placeholder() }
                .onFailure { _ in didFail = true }
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#if DEBUG

/// Preview-only: Using force unwrap for clarity since the URL is static and this is not shipped to production.
#Preview {
    CachedImageView(url: .init(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!) {
        ProgressView()
    }
    .frame(width: 100, height: 100)
}

#endif
