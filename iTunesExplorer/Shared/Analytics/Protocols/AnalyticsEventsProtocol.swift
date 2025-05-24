//
//  AnalyticsEventsProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

protocol AnalyticsEventsProtocol {
    var name: String { get }
    var parameters: [String: Any]? { get }
}

protocol AnalyticsCollectible {
    func collect(event: AnalyticsEventsProtocol)
}
