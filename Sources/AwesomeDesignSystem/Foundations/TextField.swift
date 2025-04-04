//
//  TextField.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import SwiftUI

public struct AwesomeTextField: View {
    public enum TextFieldStyle {
        case standard, search, textArea
    }
    
    let title: String
    @Binding var text: String
    let style: TextFieldStyle
    let icon: Image?
    let errorMessage: String?
    let characterLimit: Int?
    
    @State private var isSecure: Bool
    private let isPassword: Bool
    
    public init(
        title: String,
        text: Binding<String>,
        style: TextFieldStyle = .standard,
        icon: Image? = nil,
        isPassword: Bool = false,
        errorMessage: String? = nil,
        characterLimit: Int? = nil
    ) {
        self.title = title
        self._text = text
        self.style = style
        self.icon = icon
        self.isPassword = isPassword
        self.isSecure = isPassword
        self.errorMessage = errorMessage
        self.characterLimit = characterLimit
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if style != .search {
                Text(title)
                    .font(.bodySmall)
                    .foregroundColor(.textSecondary)
            }
            
            HStack {
                if style == .search, let icon = icon {
                    icon
                        .foregroundColor(.textSecondary)
                }
                
                Group {
                    if isSecure {
                        SecureField(style == .search ? title : "", text: $text)
                    } else {
                        TextField(style == .search ? title : "", text: $text)
                    }
                }
                .font(.bodyMedium)
                .foregroundColor(.textPrimary)
                
                if isPassword {
                    Button(action: { isSecure.toggle() }) {
                        Image(systemName: isSecure ? "eye" : "eye.slash")
                            .foregroundColor(.textSecondary)
                    }
                }
                
                if style == .search, !text.isEmpty {
                    Button(action: { text = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.textSecondary)
                    }
                }
            }
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            
            if let error = errorMessage, !error.isEmpty {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.error)
            }
            
            if let limit = characterLimit {
                HStack {
                    Spacer()
                    Text("\(text.count)/\(limit)")
                        .font(.caption)
                        .foregroundColor(text.count > limit ? .error : .textSecondary)
                }
            }
        }
    }
    
    private var padding: EdgeInsets {
        switch style {
        case .standard, .textArea: return .init(top: 12, leading: 16, bottom: 12, trailing: 16)
        case .search: return .init(top: 8, leading: 12, bottom: 8, trailing: 12)
        }
    }
    
    private var backgroundColor: Color {
        errorMessage == nil ? .surface : Color.error.opacity(0.1)
    }
    
    private var borderColor: Color {
        errorMessage == nil ? .textSecondary.opacity(0.2) : .error
    }
    
    private var borderWidth: CGFloat {
        errorMessage == nil ? 1 : 1.5
    }
    
    private var cornerRadius: CGFloat {
        switch style {
        case .standard, .search: return 8
        case .textArea: return 12
        }
    }
}
