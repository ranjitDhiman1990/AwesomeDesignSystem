//
//  Toast.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

import SwiftUI

public struct ToastView: View {
    public enum ToastType {
        case info, success, warning, error
    }
    
    let type: ToastType
    let title: String
    let message: String?
    let duration: Double
    
    public init(type: ToastType, title: String, message: String? = nil, duration: Double = 3.0) {
        self.type = type
        self.title = title
        self.message = message
        self.duration = duration
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                icon
                    .foregroundColor(foregroundColor)
                
                Text(title)
                    .font(.bodyMedium)
                    .foregroundColor(foregroundColor)
                
                Spacer()
            }
            
            if let message = message {
                Text(message)
                    .font(.bodySmall)
                    .foregroundColor(foregroundColor.opacity(0.9))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(8)
        .shadow(radius: 10)
        .padding(.horizontal)
        .transition(.move(edge: .top))
    }
    
    private var icon: Image {
        switch type {
        case .info: return Image(systemName: "info.circle.fill")
        case .success: return Image(systemName: "checkmark.circle.fill")
        case .warning: return Image(systemName: "exclamationmark.triangle.fill")
        case .error: return Image(systemName: "xmark.circle.fill")
        }
    }
    
    private var foregroundColor: Color {
        switch type {
        case .info: return .white
        case .success: return .white
        case .warning: return .black
        case .error: return .white
        }
    }
    
    private var backgroundColor: Color {
        switch type {
        case .info: return .info
        case .success: return .success
        case .warning: return .warning
        case .error: return .error
        }
    }
}

public extension View {
    func toastView(
        isPresented: Binding<Bool>,
        type: ToastView.ToastType,
        title: String,
        message: String? = nil,
        duration: Double = 3.0
    ) -> some View {
        self.overlay(
            Group {
                if isPresented.wrappedValue {
                    VStack {
                        ToastView(type: type, title: title, message: message, duration: duration)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                    withAnimation {
                                        isPresented.wrappedValue = false
                                    }
                                }
                            }
                        Spacer()
                    }
                    .transition(.move(edge: .top))
                    .animation(.spring(), value: isPresented.wrappedValue)
                    .zIndex(1)
                }
            }
        )
    }
}
