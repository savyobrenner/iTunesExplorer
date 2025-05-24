//
//  MockAnalytics.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

final class MockAnalytics: AnalyticsCollectible {
    var events: [AnalyticsEvents] = []
    
    func collect(event: any iTunesExplorer.AnalyticsEventsProtocol) {
        guard let event = event as? AnalyticsEvents else {
            return
        }
        
        events.append(event)
    }
}
