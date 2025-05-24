//
//  LocalizationHelper.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Foundation

enum LocalizationHelper: String, CaseIterable {
    case unitedStates = "us"
    case portugal = "br"
    case spain = "es"

    var iTunesCountryCode: String {
        return rawValue
    }

    static func from(deviceLocale: Locale) -> LocalizationHelper {
        let regionCode = deviceLocale.region?.identifier.lowercased() ?? "us"
        return LocalizationHelper(rawValue: regionCode) ?? .unitedStates
    }
}
