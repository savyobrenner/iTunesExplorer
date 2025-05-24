//
//  HomeView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            Color.Brand.white
                .ignoresSafeArea()

            if viewModel.isLoading {
                LoadingView()
            } else {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Top Albums")
                        .font(.brand(.bold, size: 32))
                        .foregroundStyle(Color.Brand.black)
                        .padding(.horizontal)
                    
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.albums, id: \.id.label) { album in
                                AlbumRowView(
                                    imageURL: album.imageURL(for: .medium),
                                    albumName: album.name.label,
                                    artistName: album.artist.label,
                                    price: album.price.label
                                )
                                .padding(.horizontal)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
        }
        .onAppear { viewModel.loadData() }
    }
}

#if DEBUG
import Factory

#Preview {
HomeView(viewModel: HomeViewModel(
    coordinator: HomeCoordinator(navigationController: .init()),
    homeServices: Container.shared.homeServices()
    ))
}
#endif

