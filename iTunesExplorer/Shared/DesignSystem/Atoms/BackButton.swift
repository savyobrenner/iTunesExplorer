//
//  BackButton.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct BackButton: View {
    let onDismiss: () -> Void
    
    var body: some View {
        Button {
            onDismiss()
        } label: {
            ZStack {
                Circle()
                    .fill(Color.Brand.black.opacity(0.5))
                    .frame(width: 40, height: 40)
                
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color.Brand.primary)
                    .padding(12)
            }
            .shadow(radius: 1)
        }
    }
}

#if DEBUG

#Preview {
    BackButton() {}
}

#endif
