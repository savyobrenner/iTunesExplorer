//
//  AnalyticsEvents.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

enum PRAnalyticsEvents: AnalyticsEventsProtocol {
    
    case appLaunch
    
    case homeScreen
    case homeScreenSelectAlbum(name: String)
    
    case albumDetailsScreen
    case albumDetailsScreenBackButton
    
    var name: String {
        switch self {
        case .appLaunch: return "app_launch"
        case .homeScreen: return "home_screen"
        case .homeScreenSelectAlbum: return "home_screen_select_album"
        case .albumDetailsScreen: return "album_details_screen"
        case .albumDetailsScreenBackButton: return "album_details_screen_back_button"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .appLaunch, .homeScreen, .albumDetailsScreen, .albumDetailsScreenBackButton:
            return nil
        case let .homeScreenSelectAlbum(name):
            return ["album_name": name]
        }
    }
}
