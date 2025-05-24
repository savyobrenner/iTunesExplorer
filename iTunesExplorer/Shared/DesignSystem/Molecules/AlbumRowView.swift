//
//  AlbumRowView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct AlbumRowView: View {
    let imageURL: URL
    let albumName: String
    let artistName: String
    let price: String?

    var body: some View {
        HStack(spacing: 16) {
            CachedImageView(url: imageURL)
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(albumName)
                    .font(.brand(.bold, size: 16))
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
        .padding(.vertical, 8)
    }
}
