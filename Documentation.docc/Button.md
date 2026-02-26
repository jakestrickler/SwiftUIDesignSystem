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

## Content

### Title

```swift
Button("Title") {
    // perform action...
}
.buttonStyle(.borderedProminent)
```

![](button-title)

### Title and Symbol

```swift
Button("Title", systemImage: "questionmark.square.dashed") {
    // perform action...
}
.buttonStyle(.borderedProminent)
```

![](button-titleSymbol)

### Symbol

```swift
Button("Title", systemImage: "questionmark.square.dashed") {
    // perform action...
}
.buttonStyle(.borderedProminent)
.labelStyle(.iconOnly)
```

![](button-symbol)

## Sizes

```swift
Button("Title") {
    // perform action...
}
.buttonStyle(.borderedProminent)
.controlSize(.small)
```

| Size | Preview |
| ---- | ------- |
| [small]() | ![](button-small) |
| [regular]() | ![](button-regular) |
| [large]() | ![](button-large) |

## Border Shapes

| Shape | Preview |
| ----- | ------- |
| [capsule]() | ![](button-capsule) |
| [roundedRect]() | ![](button-roundedRect) |
| [roundedRect(radius:)]() | ![](button-roundedRectRadius) |
| [circle]() | ![](button-circle)

## Tints and Roles

```swift
Button("Delete", role: .destructive) {}
    .buttonStyle(.borderedProminent)
```

![](button-destructive)

```swift 
Button("Title") {}
    .buttonStyle(.borderedProminent)
    .tint(.green)
```

![](button-tint)

## Modifying the Styles

If your app 
