//
//  NetworkReachabilityProtocol.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

protocol NetworkReachabilityProtocol {
    var isConnected: Bool { get }
    var isCellular: Bool { get }
    var onStatusChange: ((Bool) -> Void)? { get set }
}
