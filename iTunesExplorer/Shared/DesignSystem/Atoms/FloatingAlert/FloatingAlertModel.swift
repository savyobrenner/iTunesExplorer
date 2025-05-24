//
//  FloatingAlertModel.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

struct FloatingAlertModel: Equatable {
    var type: FloatingAlertType
    var title: String
    var duration: Double = 4
    var position: AlertPosition = .top
}

extension FloatingAlertModel {
    enum AlertPosition {
        case top
        case bottom
    }
}
