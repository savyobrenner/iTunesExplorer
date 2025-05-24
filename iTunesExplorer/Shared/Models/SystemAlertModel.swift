//
//  SystemAlertModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 25/05/25.
//

import SwiftUI

struct SystemAlertModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button
}
