//
//  MockNetworkReachability.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

@testable import iTunesExplorer

final class MockNetworkReachability: NetworkReachabilityProtocol {
    var onStatusChange: ((Bool) -> Void)?
    var isConnected = true
    var isCellular = false
    
    func simulateStatusChange(to status: Bool) {
        isConnected = status
        onStatusChange?(status)
    }
}
