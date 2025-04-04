//
//  ViewInspector.swift
//  AwesomeDesignSystem
//
//  Created by Dhiman Ranjit on 04/04/25.
//

#if DEBUG
import SwiftUI

public struct ViewInspector<T: View>: UIViewRepresentable {
    let view: T
    let inspection: (UIView) -> Void
    
    public init(_ view: T, inspection: @escaping (UIView) -> Void) {
        self.view = view
        self.inspection = inspection
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIHostingController(rootView: self.view).view!
        inspection(view)
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed
    }
}

public extension View {
    func inspect(inspection: @escaping (UIView) -> Void) -> some View {
        ViewInspector(self, inspection: inspection)
    }
    
    func inspectViewHierarchy() -> some View {
        inspect { view in
            print(view.debugHierarchy())
        }
    }
}

private extension UIView {
    func debugHierarchy(level: Int = 0) -> String {
        let indent = String(repeating: "  ", count: level)
        var result = "\(indent)\(type(of: self))"
        
        if let identifiable = (self as? any Identifiable) {
            result += " (id: \(identifiable.id))"
        }
        
        result += "\n"
        
        for subview in subviews {
            result += subview.debugHierarchy(level: level + 1)
        }
        
        return result
    }
}
#endif
