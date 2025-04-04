//
//  DateFormatter.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import Foundation

public final actor AwesomeDateFormatter {
    public static let shared = AwesomeDateFormatter()
    
    private var formatters: [String: DateFormatter] = [:]
    private let queue = DispatchQueue(label: "com.awesome.designsystem.dateformatter",
                                      attributes: .concurrent)
    
    private init() {}
    
    public func formatter(withFormat format: String,
                          timeZone: TimeZone = .current,
                          locale: Locale = .current) -> DateFormatter {
        let key = "\(format)\(timeZone.identifier)\(locale.identifier)"
        
        return queue.sync {
            if let formatter = formatters[key] {
                return formatter
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.timeZone = timeZone
            formatter.locale = locale
            formatters[key] = formatter
            
            return formatter
        }
    }
    
    // Common formats
    public enum StandardFormat: String {
        case iso8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
        case dateOnly = "yyyy-MM-dd"
        case timeOnly = "HH:mm:ss"
        case fullDateTime = "yyyy-MM-dd HH:mm:ss"
        case readableDate = "MMMM d, yyyy"
    }
    
    public func string(from date: Date,
                       format: StandardFormat,
                       timeZone: TimeZone = .current,
                       locale: Locale = .current) -> String {
        let formatter = self.formatter(withFormat: format.rawValue,
                                       timeZone: timeZone,
                                       locale: locale)
        return formatter.string(from: date)
    }
    
    public func date(from string: String,
                     format: StandardFormat,
                     timeZone: TimeZone = .current,
                     locale: Locale = .current) -> Date? {
        let formatter = self.formatter(withFormat: format.rawValue,
                                       timeZone: timeZone,
                                       locale: locale)
        return formatter.date(from: string)
    }
}
