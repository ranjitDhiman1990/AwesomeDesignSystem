import SwiftUI
import Combine

@MainActor
class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        Task {
            await observeKeyboardChanges()
        }
    }
    
    @MainActor
    private func observeKeyboardChanges() async {
        let notificationCenter = NotificationCenter.default
        
        let keyboardWillShow = notificationCenter.publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect }
            .map { $0.height }
        
        let keyboardWillHide = notificationCenter.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        for await height in keyboardWillShow.values {
            self.keyboardHeight = height
        }
        
        for await _ in keyboardWillHide.values {
            self.keyboardHeight = 0
        }
    }
}
