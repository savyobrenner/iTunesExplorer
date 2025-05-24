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
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.title)
                            .font(.brand(.bold, size: 24))
                            .foregroundStyle(Color.Brand.black)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.Brand.white)
                    .shadow(color: Color.Brand.black.opacity(0.1), radius: 8, x: 0, y: 4)
                    .zIndex(1)

                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.albums, id: \.name.label) { album in
                                AlbumRowView(
                                    imageURL: album.imageURL(for: .medium),
                                    albumName: album.name.label,
                                    artistName: album.artist.label,
                                    price: album.price.label,
                                    genre: album.category.attributes.label,
                                    releaseDate: album.releaseDate.label
                                )
                                .padding(.horizontal)
                                .onTapGesture {
                                    viewModel.openDetails(for: album)
                                }
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                    }
                    .zIndex(0)
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
        .showAlert(alert: $viewModel.currentAlert)
    }
}

#if DEBUG
import Factory

#Preview {
    HomeView(viewModel: HomeViewModel(
        coordinator: HomeCoordinator(navigationController: .init()),
        homeRepository: Container.shared.homeRepository(),
        analytics: Container.shared.analytics()
    ))
}
#endif

