//
//  Colors.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import SwiftUI

public extension Color {
    // Primary, Secondary, Tertiary Colors
    static let primary = Color("Primary", bundle: .module)
    static let primaryDark = Color("PrimaryDark", bundle: .module)
    static let primaryLight = Color("PrimaryLight", bundle: .module)
    
    static let secondary = Color("Secondary", bundle: .module)
    static let secondaryDark = Color("SecondaryDark", bundle: .module)
    static let secondaryLight = Color("SecondaryLight", bundle: .module)
    
    static let tertiary = Color("Tertiary", bundle: .module)
    static let tertiaryDark = Color("TertiaryDark", bundle: .module)
    static let tertiaryLight = Color("TertiaryLight", bundle: .module)
    
    // Semantic Colors
    static let success = Color("Success", bundle: .module)
    static let warning = Color("Warning", bundle: .module)
    static let error = Color("Error", bundle: .module)
    static let info = Color("Info", bundle: .module)
    
    // Neutrals
    static let background = Color("Background", bundle: .module)
    static let surface = Color("Surface", bundle: .module)
    static let textPrimary = Color("TextPrimary", bundle: .module)
    static let textSecondary = Color("TextSecondary", bundle: .module)
    
    // Functional
    static let disabled = Color("Disabled", bundle: .module)
}

public extension UIColor {
    // Primary, Secondary, Tertiary Colors
    static let primary = UIColor(named: "Primary", in: .module, compatibleWith: nil)!
    static let primaryDark = UIColor(named: "PrimaryDark", in: .module, compatibleWith: nil)!
    static let primaryLight = UIColor(named: "PrimaryLight", in: .module, compatibleWith: nil)!
    
    static let secondary = UIColor(named: "Secondary", in: .module, compatibleWith: nil)!
    static let secondaryDark = UIColor(named: "SecondaryDark", in: .module, compatibleWith: nil)!
    static let secondaryLight = UIColor(named: "SecondaryLight", in: .module, compatibleWith: nil)!
    
    static let tertiary = UIColor(named: "Tertiary", in: .module, compatibleWith: nil)!
    static let tertiaryDark = UIColor(named: "TertiaryDark", in: .module, compatibleWith: nil)!
    static let tertiaryLight = UIColor(named: "TertiaryLight", in: .module, compatibleWith: nil)!
    
    // Semantic Colors
    static let success = UIColor(named: "Success", in: .module, compatibleWith: nil)!
    static let warning = UIColor(named: "Warning", in: .module, compatibleWith: nil)!
    static let error = UIColor(named: "Error", in: .module, compatibleWith: nil)!
    static let info = UIColor(named: "Info", in: .module, compatibleWith: nil)!
    
    // Neutrals
    static let background = UIColor(named: "Background", in: .module, compatibleWith: nil)!
    static let surface = UIColor(named: "Surface", in: .module, compatibleWith: nil)!
    static let textPrimary = UIColor(named: "TextPrimary", in: .module, compatibleWith: nil)!
    static let textSecondary = UIColor(named: "TextSecondary", in: .module, compatibleWith: nil)!
    
    // Functional
    static let disabled = UIColor(named: "Disabled", in: .module, compatibleWith: nil)!
}
