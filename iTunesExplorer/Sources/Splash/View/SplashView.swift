//
//  SplashView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

struct SplashView<ViewModel: SplashViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.Brand.white
            
            LottieView(animationName: "teya_splash_shorter", loopMode: .playOnce) {
                viewModel.load()
            }
            .accessibilityLabel("splash_animation")
        }
        .ignoresSafeArea()
    }
}

#if DEBUG
import Factory

#Preview {
    SplashView(viewModel: SplashViewModel(
        coordinator: SplashCoordinator(navigationController: .init()),
        analytics: Container.shared.analytics()
    ))
}
#endif

