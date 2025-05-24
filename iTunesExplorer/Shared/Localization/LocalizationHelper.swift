//
//  LocalizationHelper.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

enum LocalizationHelper: String, CaseIterable {
    case unitedStates = "us"
    case portugal = "pt"
    case brazil = "br"
    case spain = "es"

    var iTunesCountryCode: String {
        return rawValue
    }
    
    var countryName: String {
        switch self {
        case .unitedStates:
            return "United States"
        case .portugal:
            return "Portugal"
        case .brazil:
            return "Brasil"
        case .spain:
            return "España"
        }
    }

    static func from(deviceLocale: Locale) -> LocalizationHelper {
        let regionCode = deviceLocale.region?.identifier.lowercased() ?? "us"
        return LocalizationHelper(rawValue: regionCode) ?? .unitedStates
    }
}
