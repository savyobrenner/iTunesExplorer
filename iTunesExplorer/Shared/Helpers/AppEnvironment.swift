//
//  AppEnvironment.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

enum AppEnvironment {
    
    static var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    static var isDebug: Bool {
    #if DEBUG
        true
    #else
        false
    #endif
    }
}


