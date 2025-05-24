//
//  FloatingAlertView.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

struct FloatingAlertView: View {
    let alert: FloatingAlertModel
    
    var body: some View {
        HStack {
            alert.type.icon
                .foregroundStyle(Color.Brand.black)
            
            Text(alert.title)
                .font(.brand(.regular, size: 14))
                .foregroundStyle(Color.Brand.black)
            
            Spacer()
        }
        .padding()
        .background(alert.type.backgroundColor)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
}
