# FoundationKit

A lightweight Swift utility library providing common types, extensions, and logging infrastructure for iOS and macOS applications.

## Requirements

- iOS 16.0+
- macOS 13.0+
- Swift 6.1+

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/FoundationKit.git", from: "1.0.0")
]
```

Or add it through Xcode:
1. File > Add Package Dependencies
2. Enter the repository URL
3. Select "FoundationKit" library

## Features

### Categorized Logging

FoundationKit provides pre-configured `OSLog.Logger` instances for different application domains:

```swift
import FoundationKit
import OSLog

// General app logging
Logger.app.info("Application started")

// UI and view-related logging
Logger.ui.debug("View did appear")

// Data and persistence logging
Logger.data.error("Failed to save data")

// Rendering and graphics logging
Logger.rendering.debug("Frame rendered")

// File operations logging
Logger.fileOps.info("File saved successfully")

// Export operations (GIF, LivePhoto, etc.)
Logger.export.info("Export completed")

// Canvas and drawing operations
Logger.canvas.debug("Canvas updated")

// Brush engine logging
Logger.brush.debug("Brush stroke applied")

// Performance monitoring
Logger.performance.info("Operation took 50ms")
```

### Weak Reference Proxy

`WeakRefVirtualProxy` helps prevent retain cycles in delegation patterns, observers, or timer callbacks:

```swift
import FoundationKit

class ViewController: UIViewController {
    private var proxy: WeakRefVirtualProxy<ViewController>?

    override func viewDidLoad() {
        super.viewDidLoad()
        proxy = WeakRefVirtualProxy(self)

        // Use proxy.object to safely access the weak reference
        someService.delegate = proxy
    }
}
```

### Structured Error Handling

`ErrorMessage` provides a structured way to represent errors with unique identification:

```swift
import FoundationKit

let error = ErrorMessage(
    title: "Save Failed",
    message: "Unable to save the document. Please try again."
)

// Each error has a unique identifier
print(error.id)      // UUID
print(error.title)   // "Save Failed"
print(error.message) // "Unable to save..."
```

### Error Presentation State

`ErrorPresentation` enum for managing error UI display states:

```swift
import FoundationKit

var errorState: ErrorPresentation = .dismissed

// When showing an error
errorState = .presenting

// When user dismisses the error
errorState = .dismissed
```

### Safe Array Access

Safe subscript for arrays that returns `nil` instead of crashing on out-of-bounds access:

```swift
import FoundationKit

let array = [1, 2, 3]

// Safe access - returns nil if index is out of bounds
let element = array[safe: 5]  // nil (no crash)
let valid = array[safe: 1]    // Optional(2)
```

### Custom Notifications

Pre-defined notification names for common events:

```swift
import FoundationKit

// Listen for file receipt events
NotificationCenter.default.addObserver(
    forName: .didReceiveDotShakeFile,
    object: nil,
    queue: .main
) { notification in
    // Handle received file
}
```

## Project Structure

```
FoundationKit/
├── Sources/FoundationKit/
│   ├── Logger+DotShake.swift      # Categorized logging infrastructure
│   ├── WeakRefVirtualProxy.swift  # Generic weak reference proxy
│   ├── ErrorMessage.swift         # Structured error type
│   ├── ErrorPresentation.swift    # Error UI state enum
│   └── Array+EXT.swift            # Array and Notification extensions
├── Tests/FoundationKitTests/
│   └── FoundationKitTests.swift   # Unit tests
└── Package.swift
```

## License

MIT License

## Author

ChenZhen
