//
//  AnalyticsEvents.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

enum PRAnalyticsEvents: AnalyticsEventsProtocol {
    
    case appLaunch
    case homeScreen
    
    var name: String {
        switch self {
        case .appLaunch: return "app_launch"
        case .homeScreen: return "home_screen"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .appLaunch, .homeScreen:
            return nil
        }
    }
}
