//
//  NetworkReachability.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import Network

actor NetworkReachability {
    static let shared = NetworkReachability()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    
    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    private init() {
        monitor.start(queue: queue)
    }
    
    func startMonitoring(_ callback: @escaping @Sendable (Bool) -> Void) {
        monitor.pathUpdateHandler = { path in
            Task { @MainActor in
                callback(path.status == .satisfied)
            }
        }
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
