//
//  OfflineModeBanner.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct OfflineModeBanner: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                Image(systemName: "wifi.slash")
                    .foregroundStyle(.white)
                
                Text("Offline Mode Enabled")
                    .font(.brand(.semibold, size: 14))
                    .foregroundStyle(.white)
            }

            Text("Some data may be outdated or images may not load correctly.")
                .font(.brand(.light, size: 12))
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.Brand.warning)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
        .transition(.move(edge: .top).combined(with: .opacity))
        .frame(maxWidth: .infinity)
    }
}

#if DEBUG

#Preview {
    OfflineModeBanner()
}

#endif
