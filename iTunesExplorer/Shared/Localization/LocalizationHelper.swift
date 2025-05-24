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

    static func from(deviceLocale: Locale = .current) -> LocalizationHelper {
        let appLanguage = Bundle.main.preferredLocalizations.first?.lowercased() ?? "en"

        switch appLanguage {
        case "pt-br":
            return .brazil
        case "pt-pt":
            return .portugal
        case "es":
            return .spain
        case "en":
            return .unitedStates
        default:
            break
        }

        // Fallback to device region
        if let regionCode = deviceLocale.region?.identifier.lowercased(),
           let match = LocalizationHelper(rawValue: regionCode) {
            return match
        }

        return .unitedStates
    }
}
