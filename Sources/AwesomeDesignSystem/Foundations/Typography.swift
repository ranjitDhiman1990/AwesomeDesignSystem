//
//  Typography.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import SwiftUI

public enum AwesomeFont {
    case light, regular, medium, bold, italic
    
    var name: String {
        switch self {
        case .light:
            return "Roboto-Light"
        case .regular:
            return "Roboto-Regular"
        case .medium:
            return "Roboto-Medium"
        case .bold:
            return "Roboto-Bold"
        case .italic:
            return "Roboto-Italic"
        }
    }
    
    func size(_ size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}

public extension Font {
    /// Headings
    /// - `h1`: 32pt, Bold
    /// - `h2`: 28pt, Bold
    /// - `h3`: 24pt, Bold
    /// - `h4`: 20pt, Bold

    static let h1 = AwesomeFont.bold.size(32)
    static let h2 = AwesomeFont.bold.size(28)
    static let h3 = AwesomeFont.bold.size(24)
    static let h4 = AwesomeFont.bold.size(20)
    
    
    /// Body
    /// - `large`: 18pt, regular
    /// - `medium`: 16pt, regular
    /// - `small`: 14pt, regular

    static let large = AwesomeFont.regular.size(18)
    static let medium = AwesomeFont.medium.size(16)
    static let small = AwesomeFont.medium.size(14)
    
    /// Caption
    /// - `caption`: 12pt, regular
    
    static let caption = AwesomeFont.regular.size(12)
    
    /// Caption
    /// - `bodyLarge`: 14pt, regular
    /// - `bodyMedium`: 12pt, regular
    /// - `bodySmall`: 10pt, regular

    static let bodyLarge = AwesomeFont.regular.size(14)
    static let bodyMedium = AwesomeFont.regular.size(12)
    static let bodySmall = AwesomeFont.regular.size(10)
    
    
    /// Buttons
    /// - `caption`: 12pt, regular
    
    static let buttonLarge = AwesomeFont.medium.size(18)
    static let buttonMedium = AwesomeFont.medium.size(16)
    static let buttonSmall = AwesomeFont.medium.size(14)
}
