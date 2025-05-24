//
//  String+Extensions.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import SwiftUI

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func formattedReleaseDate(from inputFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ",
                              to outputFormat: String = "dd MMM yyyy",
                              locale: Locale = .current) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = inputFormat
        formatter.locale = locale

        guard let date = formatter.date(from: self) else { return nil }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat
        outputFormatter.locale = locale

        return outputFormatter.string(from: date)
    }
}
