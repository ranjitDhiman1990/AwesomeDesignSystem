//
//  Buttons.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import SwiftUI

public struct AwesomeButton: View {
    public enum ButtonSize {
        case large, medium, small
    }
    
    public enum ButtonStyle {
        case primary, secondary, tertiary, danger
    }
    
    let title: String
    let icon: Image?
    let action: () -> Void
    let size: ButtonSize
    let style: ButtonStyle
    let isFullWidth: Bool
    let isLoading: Bool
    
    public init(
        title: String,
        icon: Image? = nil,
        size: ButtonSize = .medium,
        style: ButtonStyle = .primary,
        isFullWidth: Bool = true,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.action = action
        self.size = size
        self.style = style
        self.isFullWidth = isFullWidth
        self.isLoading = isLoading
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                } else {
                    if let icon = icon {
                        icon
                    }
                    Text(title)
                }
            }
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .padding(padding)
            .font(font)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .opacity(isLoading ? 0.8 : 1.0)
        }
        .disabled(isLoading)
    }
    
    private var padding: EdgeInsets {
        switch size {
        case .large: return .init(top: 16, leading: 24, bottom: 16, trailing: 24)
        case .medium: return .init(top: 12, leading: 20, bottom: 12, trailing: 20)
        case .small: return .init(top: 8, leading: 16, bottom: 8, trailing: 16)
        }
    }
    
    private var font: Font {
        switch size {
        case .large: return .buttonLarge
        case .medium: return .buttonMedium
        case .small: return .buttonSmall
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .large: return 12
        case .medium: return 10
        case .small: return 8
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary: return .white
        case .secondary: return .secondary
        case .tertiary: return .tertiary
        case .danger: return .white
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .primary: return .primary
        case .secondary: return .clear
        case .tertiary: return .clear
        case .danger: return .error
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .primary: return .clear
        case .secondary: return .primary
        case .tertiary: return .textSecondary.opacity(0.2)
        case .danger: return .clear
        }
    }
    
    private var borderWidth: CGFloat {
        switch style {
        case .primary, .danger: return 0
        case .secondary, .tertiary: return 1
        }
    }
}
