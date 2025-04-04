//
//  ThemeManager.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import SwiftUI

public enum AwesomeTheme: String, CaseIterable, Sendable {
    case light
    case dark
    
    public var primaryColor: Color {
        switch self {
        case .light: return .primaryLight
        case .dark: return .primaryDark
        }
    }
    
    public var backgroundColor: Color {
        switch self {
        case .light: return .white
        case .dark: return .black
        }
    }
    
    public var colorScheme: ColorScheme {
        self == .dark ? .dark : .light
    }
}

@MainActor
public final class ThemeManager: ObservableObject {
    public static let shared = ThemeManager()
    
    @Published public private(set) var currentTheme: AwesomeTheme
    @Published public private(set) var colorScheme: ColorScheme = .light
    
    private let userDefaults: UserDefaults
    private let notificationCenter: NotificationCenter
    
    init(
        userDefaults: UserDefaults = .standard,
        notificationCenter: NotificationCenter = .default
    ) {
        self.userDefaults = userDefaults
        self.notificationCenter = notificationCenter
        
        let savedTheme = userDefaults.string(forKey: "awesomeSelectedTheme")
        self.currentTheme = AwesomeTheme(rawValue: savedTheme ?? "light") ?? .light
        self.colorScheme = currentTheme.colorScheme
        
        setupObservers()
    }
    
    private func setupObservers() {
        notificationCenter.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: userDefaults,
            queue: .main
        ) { [weak self] _ in
            Task { @MainActor [weak self] in
                self?.handleUserDefaultsChange()
            }
        }
    }
    
    private func handleUserDefaultsChange() {
        let savedTheme = userDefaults.string(forKey: "awesomeSelectedTheme")
        let newTheme = AwesomeTheme(rawValue: savedTheme ?? "light") ?? .light
        
        if newTheme != currentTheme {
            applyTheme(newTheme, updateUserDefaults: false)
        }
    }
    
    public func applyTheme(_ theme: AwesomeTheme, updateUserDefaults: Bool = true) {
        currentTheme = theme
        colorScheme = theme.colorScheme
        
        if updateUserDefaults {
            userDefaults.set(theme.rawValue, forKey: "awesomeSelectedTheme")
        }
        
        applyUIKitAppearance()
    }
    
    public func toggleDarkMode() {
        applyTheme(currentTheme == .dark ? .light : .dark)
    }
    
    private func applyUIKitAppearance() {
        UIView.appearance().tintColor = UIColor(currentTheme.primaryColor)
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(currentTheme.primaryColor)
        ]
    }
}

// MARK: - SwiftUI Integration
private struct ThemeManagerKey: EnvironmentKey {
    static var defaultValue: ThemeManager {
        DispatchQueue.main.sync {
            ThemeManager.shared
        }
    }
}

public extension EnvironmentValues {
    var themeManager: ThemeManager {
        get { self[ThemeManagerKey.self] }
        set { self[ThemeManagerKey.self] = newValue }
    }
}

public extension View {
    func withThemeManager() -> some View {
        self.environment(\.themeManager, ThemeManager.shared)
    }
}
