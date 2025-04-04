//
//  Localization.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import Foundation

public actor AwesomeLocalization {
    public static let shared = AwesomeLocalization()
    
    private var bundle: Bundle = .main
    
    public func setLanguage(_ languageCode: String) {
        guard let path = Bundle.module.path(forResource: languageCode, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            self.bundle = .main
            return
        }
        self.bundle = bundle
    }
    
    public func localizedString(forKey key: String, defaultValue: String = "") -> String {
        return bundle.localizedString(forKey: key, value: defaultValue, table: nil)
    }
    
    // Convenience method
    public static func string(_ key: String, defaultValue: String = "") async -> String {
        return await shared.localizedString(forKey: key, defaultValue: defaultValue)
    }
}

public extension String {
    func localized() async -> String {
        return await AwesomeLocalization.string(self)
    }
    
    func localized(with arguments: CVarArg...) async -> String {
        let localizedString = await localized()
        return String(format: localizedString, arguments: arguments)
    }
}
