//
//  NetworkMonitor.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import Network
import SwiftUI

final class NetworkMonitor: NetworkReachabilityProtocol {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published
    private(set) var isConnected = true
    
    var onStatusChange: ((Bool) -> Void)?

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            let status = path.status == .satisfied
            DispatchQueue.main.async {
                let old = self?.isConnected
                self?.isConnected = status
                if old != status {
                    self?.onStatusChange?(status)
                }
            }
        }
        
        monitor.start(queue: queue)
    }
}
