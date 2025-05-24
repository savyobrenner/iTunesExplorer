//
//  AlbumDetailsView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct AlbumDetailsView<ViewModel: AlbumDetailsViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.Brand.white
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    CachedImageView(url: viewModel.album.imageURL(for: .large)) {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.album.name.label)
                            .font(.brand(.bold, size: 24))
                            .foregroundStyle(Color.Brand.black)
                        
                        Text(viewModel.album.artist.label)
                            .font(.brand(.regular, size: 18))
                            .foregroundStyle(Color.Brand.black)
                        
                        Text("\(viewModel.album.itemCount.label) tracks")
                            .font(.brand(.light, size: 14))
                            .foregroundStyle(Color.Brand.gray)
                        
                        if let releaseDate = viewModel.formattedReleaseDate {
                            Text("Released: \(releaseDate)")
                                .font(.brand(.light, size: 14))
                                .foregroundStyle(Color.Brand.gray)
                        }
                        
                        Text("Genre: \(viewModel.album.category.attributes.label)")
                            .font(.brand(.light, size: 14))
                            .foregroundStyle(Color.Brand.gray)
                        
                        Text("Price: \(viewModel.album.price.label)")
                            .font(.brand(.light, size: 14))
                            .foregroundStyle(Color.Brand.gray)
                        
                        if let artistURL = viewModel.album.artist.attributes?.href {
                            Link("More from \(viewModel.album.artist.label)", destination: artistURL)
                                .font(.brand(.regular, size: 14))
                                .foregroundStyle(.blue)
                                .padding(.top, 8)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
        }
        .onAppear { }
    }
}

#if DEBUG
import Factory

/// Preview-only: Using force unwrap for clarity since the URL is static and this is not shipped to production.
#Preview {
    let mockAlbum = AlbumItemResponse(
        name: .init(label: "The Dark Side of the Moon"),
        images: [
            .init(label: URL(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!, attributes: .init(height: "60")),
            .init(label: URL(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!, attributes: .init(height: "100")),
            .init(label: URL(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!, attributes: .init(height: "200"))
        ],
        itemCount: .init(label: "10"),
        price: .init(label: "R$ 39,90", attributes: .init(amount: "39.90", currency: "BRL")),
        contentType: .init(
            contentType: .init(attributes: .init(term: "Album", label: "Album")),
            attributes: .init(term: "Album", label: "Album")
        ),
        rights: .init(label: "℗ 1973 Pink Floyd Records"),
        title: .init(label: "The Dark Side of the Moon - Pink Floyd"),
        link: .init(attributes: .init(rel: "alternate", type: "text/html", href: "https://music.apple.com/album/12345")),
        id: .init(label: "https://music.apple.com/album/12345", attributes: .init(imID: "12345")),
        artist: .init(label: "Pink Floyd", attributes: .init(href: URL(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!)),
        category: .init(attributes: .init(id: "1", term: "Rock", scheme: "https://example.com", label: "Rock")),
        releaseDate: .init(label: "1973-03-01T00:00:00-07:00", attributes: .init(label: "1973-03-01"))
    )
    
    
    AlbumDetailsView(viewModel: AlbumDetailsViewModel(
        coordinator: AlbumDetailsCoordinator(
            album: mockAlbum,
            navigationController: .init()
        ), album: mockAlbum
    ))
}
#endif

