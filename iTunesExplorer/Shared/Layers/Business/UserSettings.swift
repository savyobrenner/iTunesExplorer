//
//  UserSettings.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Factory

protocol UserSettingsProtocol {
    var user: String? { get }
}

class UserSettings: UserSettingsProtocol {
    
    private(set) lazy var user: String? = {
        (try? Container.shared.serviceLocator().cacheManager.fetch(String.self, for: .user))
    }()
}


