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
        return AppError(statusCode: 500, message: "Unknown error")
    }
    
    static var networkError: AppError {
        return AppError(statusCode: -1, message: "Connection error")
    }
    
    static var timeoutError: AppError {
        return AppError(statusCode: -2, message: "Request timed out")
    }
    
    static var serverError: AppError {
        return AppError(statusCode: 500, message: "Internal server error")
    }
    
    static var invalidResponse: AppError {
        return AppError(statusCode: AppConstants.statusCodeForParseError, message: "Internal server error")
    }
    
}
