# AwesomeDesignSystem
AwesomeDesignSystem is a Swift Package that offers a reusable design system for iOS, macOS, tvOS, and watchOS. It includes custom fonts, Lottie animations, and design assets, making it easy to build consistent, polished UIs. Built-in Lottie support and bundled resources ensure seamless integration across projects.

## Features

- 🎨 Comprehensive design foundations (colors, typography, themes)
- 🛠️ Reusable UI components (buttons, text fields, toasts)
- 📦 Resource management (assets, fonts, animations)
- 🛠️ Utility functions for common tasks

## Requirements

- iOS 15.0+
- macOS 12.0+
- tvOS 15.0+
- watchOS 8.0+
- Swift 6.0+

## Installation

### Swift Package Manager

Add the package dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/AwesomeDesignSystem.git", from: "1.0.0")
]
```

Or add it through Xcode:

1. Go to File → Add Package Dependencies
2. Enter the repository URL
3. Select your desired version rule



## Directory Structure

    AwesomeDesignSystem/
    ├── Sources/
    │   ├── AwesomeDesignSystem/
    │   │   ├── Foundations/
    │   │   │   ├── Colors
    │   │   │   ├── Typography
    │   │   │   └── ThemeManager
    │   │   ├── Components/
    │   │   │   ├── Button
    │   │   │   ├── TextField
    │   │   │   └── Toast
    │   │   ├── Resources/
    │   │   │   ├── Fonts
    │   │   │   ├── LottieFiles
    │   │   │   └── Assets.xcassets
    │   │   └── Utils/
    │   │       ├── DateFormatter
    │   │       ├── Debouncer
    │   │       ├── HapticFeedback
    │   │       ├── Keyboard
    │   │       ├── Localization
    │   │       ├── Logger
    │   │       ├── NetworkReachability
    │   │       └── ViewInspector
    ├── Tests/
    │   └── AwesomeDesignSystemTests/
    │       └── ButtonTests
    ├── Package.swift
    └── README.md


## Dependencies

- [Lottie](https://github.com/airbnb/lottie-spm) 4.5.1 - For animation support

## Usage

### Import the package

    import AwesomeDesignSystem

    
    
### Example: Using a Button

    let button = DSButton(style: .primary)
    button.setTitle("Click Me", for: .normal)


### Example: Applying Theme

    ThemeManager.apply(.dark)


### Testing

Run tests from Xcode or via command line:

    swift test

