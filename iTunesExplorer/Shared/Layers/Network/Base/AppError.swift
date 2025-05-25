//
//  AppError.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

import Foundation

struct AppError: Error, Codable, Equatable {
    var statusCode: Int?
    var message: String?
    
    init(statusCode: Int? = nil, message: String? = nil) {
        self.statusCode = statusCode
        self.message = message
    }
    
    static var unknownError: AppError {
        return AppError(statusCode: 500, message: "error.unknown".localized)
    }
    
    static var networkError: AppError {
        return AppError(statusCode: -1, message: "error.network".localized)
    }
    
    static var timeoutError: AppError {
        return AppError(statusCode: -2, message: "error.timeout".localized)
    }
    
    static var serverError: AppError {
        return AppError(statusCode: 500, message: "error.server".localized)
    }
    
    static var invalidResponse: AppError {
        return AppError(statusCode: -10, message: "error.invalid_response".localized)
    }
}
