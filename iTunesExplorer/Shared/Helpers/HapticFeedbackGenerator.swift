//
//  HapticFeedbackGenerator.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//


import UIKit

enum HapticFeedbackGenerator {
    static func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }

    static func warning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    static func error() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
