//
//  LoadingView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ProgressView()
                .scaleEffect(1.5)
                .tint(Color.Brand.primaryThirdPalette)
            
            Spacer()
        }
    }
}

#if DEBUG

#Preview {
    LoadingView()
}

#endif
