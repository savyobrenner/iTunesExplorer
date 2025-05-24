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
            Color.Brand.black

            EmptyView()
        }
        .ignoresSafeArea()
        .onAppear { }
    }
}

#if DEBUG
import Factory

#Preview {
HomeView(viewModel: HomeViewModel(
        coordinator: HomeCoordinator(navigationController: .init())
    ))
}
#endif

