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
                    .accessibilityLabel("home_loading")
            } else {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.title)
                            .font(.brand(.bold, size: 24))
                            .foregroundStyle(Color.Brand.black)
                            .accessibilityLabel("home_title")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.Brand.white)
                    .shadow(color: Color.Brand.black.opacity(0.1), radius: 8, x: 0, y: 4)
                    .zIndex(1)

                    ScrollView {
                        if !viewModel.isOnline {
                            OfflineModeBanner()
                                .padding(.top, 10)
                                .padding(.horizontal, 16)
                                .accessibilityLabel("home_offline_banner")
                        }
                        
                        LazyVStack(spacing: 12) {
                            ForEach(Array(viewModel.albums.enumerated()), id: \.element.id) { index, album in
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
                                .accessibilityLabel("home_row_view_\(index)")
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
        .alert(item: $viewModel.systemAlert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                primaryButton: alert.primaryButton,
                secondaryButton: alert.secondaryButton
            )
        }
    }
}

#if DEBUG
import Factory

#Preview {
    HomeView(viewModel: HomeViewModel(
        coordinator: HomeCoordinator(navigationController: .init()),
        homeRepository: Container.shared.homeRepository(),
        analytics: Container.shared.analytics(),
        reachability: Container.shared.networkMonitor()
    ))
}
#endif

