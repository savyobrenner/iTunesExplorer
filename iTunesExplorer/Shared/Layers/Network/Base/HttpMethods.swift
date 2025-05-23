//
//  HttpMethods.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 23/05/25.
//

enum HttpMethods {
    case get

    var methodName: String {
        switch self {
        case .get: return "GET"
        }
    }
}
