# Button

A control that initiates an action.

## Overview

## Styles

SwiftUI provides various button styles for various use cases and prominence levels. Apply these styles to your buttons using the [`buttonStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/buttonstyle(_:)) modifier.

### Bordered Prominent

Use the [`borderedProminent`](https://developer.apple.com/documentation/swiftui/primitivebuttonstyle/borderedprominent) style for primary actions. 

```swift
Button("Title") {
    // perform action...
}
.buttonStyle(.borderedProminent)
```

![](button-borderedProminent)

### Bordered

Use the [`bordered`](https://developer.apple.com/documentation/swiftui/primitivebuttonstyle/bordered) style for secondary actions.

```swift
Button("Title") {
    // perform action...
}
.buttonStyle(.bordered)
```

![](button-bordered)

### Borderless

Use the [`borderless`](https://developer.apple.com/documentation/swiftui/primitivebuttonstyle/bordered) style for tertiary actions. It behaves as interactive text, with no additional padding applied around the button.

```swift
Button("Title") {
    // perform action...
}
.buttonStyle(.borderless)
```

![](button-borderless)
