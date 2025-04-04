//
//  Debouncer.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import Foundation

public actor Debouncer<T> {
    private let delay: TimeInterval
    private var task: Task<Void, Never>?
    
    public init(delay: TimeInterval) {
        self.delay = delay
    }
    
    public func debounce(_ value: T) async -> T {
        task?.cancel()
        task = Task {
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        }
        await task?.value
        return value
    }
}

public actor Throttler<T> {
    private let interval: TimeInterval
    private var lastSent: Date?
    
    public init(interval: TimeInterval) {
        self.interval = interval
    }
    
    public func throttle(_ value: T) async -> T? {
        let now = Date()
        if let lastSent = lastSent, now.timeIntervalSince(lastSent) < interval {
            return nil
        }
        self.lastSent = now
        return value
    }
}
