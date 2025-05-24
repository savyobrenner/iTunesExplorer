//
//  AlbumRowView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct AlbumRowView: View {
    let imageURL: URL?
    let albumName: String
    let artistName: String
    let price: String?
    
    var body: some View {
        HStack(spacing: 16) {
            CachedImageView(url: imageURL) {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(albumName)
                    .font(.brand(.black, size: 16))
                    .lineLimit(1)
                    .foregroundStyle(Color.Brand.black)
                
                Text(artistName)
                    .font(.brand(.regular, size: 14))
                    .foregroundStyle(Color.Brand.black)
                    .lineLimit(1)

                if let price {
                    Text(price)
                        .font(.brand(.light, size: 12))
                        .foregroundStyle(Color.Brand.black)
                }
            }

            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

#if DEBUG

// Using force unwrap here because is only for preview and this code does not go to production
#Preview {
    ZStack {
        Color.Brand.black
        
        AlbumRowView(
            imageURL: .init(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!,
            albumName: "Realce",
            artistName: "Gilberto Gil",
            price: "R$ 19,90"
        )
    }
}

#endif
