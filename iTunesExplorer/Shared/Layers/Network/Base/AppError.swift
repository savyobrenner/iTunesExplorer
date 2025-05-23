//
//  AppError.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

enum AppError: Error, Equatable {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case urlError(URLError)
    case unknown
}

