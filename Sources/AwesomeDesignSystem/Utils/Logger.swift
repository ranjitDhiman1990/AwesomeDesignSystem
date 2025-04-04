//
//  Logger.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import os.log
import Foundation

public struct AwesomeLogger {
    public enum LogLevel {
        case debug, info, warning, error, critical
    }
    
    private let subsystem: String
    private let category: String
    private let osLog: OSLog
    
    public init(subsystem: String = Bundle.main.bundleIdentifier ?? "AwesomeDesignSystem",
                category: String = "AppLogs") {
        self.subsystem = subsystem
        self.category = category
        self.osLog = OSLog(subsystem: subsystem, category: category)
    }
    
    public func log(_ level: LogLevel = .info, _ message: String, file: String = #file, line: Int = #line, function: String = #function) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        let logMessage = "[\(fileName):\(line)] \(function) - \(message)"
        
        switch level {
        case .debug:
            os_log("%{public}@", log: osLog, type: .debug, logMessage)
        case .info:
            os_log("%{public}@", log: osLog, type: .info, logMessage)
        case .warning:
            os_log("%{public}@", log: osLog, type: .fault, logMessage)
        case .error, .critical:
            os_log("%{public}@", log: osLog, type: .error, logMessage)
        }
#endif
    }
    
    // Convenience methods
    public func debug(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        log(.debug, message, file: file, line: line, function: function)
    }
    
    public func error(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        log(.error, message, file: file, line: line, function: function)
    }
}
