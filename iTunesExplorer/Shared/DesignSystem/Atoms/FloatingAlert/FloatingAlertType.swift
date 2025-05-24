//
//  FloatingAlertType.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import SwiftUI

enum FloatingAlertType {
    case success
    case warning
    case error

    var backgroundColor: Color {
        switch self {
        case .success:
            return Color.Brand.success
        case .warning:
            return Color.Brand.warning
        case .error:
            return Color.Brand.error
        }
    }

    var icon: Image {
        switch self {
        case .success:
            return Image(systemName: "checkmark.circle")
        case .warning:
            return Image(systemName: "exclamationmark.triangle")
        case .error:
            return Image(systemName: "xmark.octagon.fill")
        }
    }
}
