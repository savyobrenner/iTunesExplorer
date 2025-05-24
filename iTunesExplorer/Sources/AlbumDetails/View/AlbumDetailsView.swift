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
        ZStack(alignment: .topLeading) {
            Color.Brand.white.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    CachedImageView(url: viewModel.album.imageURL(for: .large)) {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .background(Color.Brand.white)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.album.name.label)
                            .font(.brand(.bold, size: 26))
                            .foregroundStyle(Color.Brand.black)
                        
                        Text(viewModel.album.artist.label)
                            .font(.brand(.regular, size: 20))
                            .foregroundStyle(Color.Brand.gray)
                        
                        HStack(spacing: 6) {
                            Text(viewModel.album.category.attributes.label)
                            
                            Text("•")
                            
                            Text(viewModel.trackCount)
                            
                            Text("•")
                            
                            Text(viewModel.album.releaseDate.attributes.label)
                        }
                        .font(.brand(.light, size: 16))
                        .foregroundStyle(Color.Brand.gray)
                        
                        Text(viewModel.price)
                            .font(.brand(.semibold, size: 16))
                            .foregroundStyle(Color.Brand.primaryThirdPalette)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
                    )
                    .padding(.horizontal, 10)
                }
            }
            .ignoresSafeArea()
            
            BackButton() {
                viewModel.dismiss(animated: true)
            }
            .padding(.leading, 24)
            .padding(.top)
            
            VStack(alignment: .center) {
                Spacer()
                
                if let artistURL = viewModel.album.artist.attributes?.href, viewModel.isOnline {
                    Button {
                        UIApplication.shared.open(artistURL, options: [:], completionHandler: nil)
                    } label: {
                        HStack {
                            Image(systemName: "music.note")
                            
                            Text("listen.on.apple.music".localized)
                                .font(.brand(.bold, size: 24))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.Brand.red)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(height: 40)
                    }
                }
                
                if !viewModel.isOnline {
                    OfflineModeBanner()
                }
            }
            .frame(maxWidth: .infinity)
        }
        .showAlert(alert: $viewModel.currentAlert)
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
        title: .init(label: "The Dark Side of the Moon - Pink Floyd"),
        artist: .init(label: "Pink Floyd", attributes: .init(href: URL(string: "https://pbs.twimg.com/profile_images/1642888479284576258/gv0ezo99_400x400.jpg")!)),
        category: .init(attributes: .init(id: "1", term: "Rock", scheme: "https://example.com", label: "Rock")),
        releaseDate: .init(label: "1973-03-01T00:00:00-07:00", attributes: .init(label: "1973-03-01"))
    )
    
    
    AlbumDetailsView(
        viewModel: AlbumDetailsViewModel(
            coordinator: AlbumDetailsCoordinator(
                album: mockAlbum,
                navigationController: .init()
            ), album: mockAlbum,
            analytics: Container.shared.analytics(),
            reachability: Container.shared.networkMonitor()
        ))
}
#endif
