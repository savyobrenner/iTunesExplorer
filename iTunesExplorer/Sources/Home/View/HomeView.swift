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
            
            if viewModel.isLoading {
                LoadingView()
            } else {
                Color.Brand.black
            }
        }
        .ignoresSafeArea()
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

