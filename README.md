# CheckoutFlow

![Swift](https://img.shields.io/badge/Swift-5.0-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

A practical sandbox application built to explore programmatic stack navigation and state persistence in SwiftUI.

The project implements a multi-step checkout flow, modeling a transition from a central Cart screen through a sequence of data-driven step views, including separate flows for promo code verification.

## Features

* **Heterogeneous Routing:** Utilizes a single navigation path capable of handling distinct data types (`Int` tokens for checkout steps and `String` tokens for promo screens) within the same stack.
* **State Synchronization:** Syncs the navigation hierarchy with data state, ensuring stack properties automatically decremented via framework bindings during native back-navigation gestures.
* **Pop to Root:** Implements direct container clearing to completely reset the navigation path and return the user back to the initial view.
* **Disk Persistence:** Serializes and deserializes the state of the type-erased navigation path to the local directory using JSON encoding.

## About the Project & Challenge

This application was developed as a hands-on implementation of **Project 9 (Days 43-46)** of the "100 Days of SwiftUI" course by Paul Hudson (Hacking with Swift). The core educational goal was to understand data-driven routing using the modern `NavigationStack(path:)` API.

To practice architectural separation, the code was refactored into an **MVVM** pattern, moving the navigation controls away from the view layer. Key concepts covered include:

* **Programmatic Navigation:** View actions trigger descriptive methods inside the business layer (`viewModel.startCheckout()`), leaving the execution of stack pushes to the ViewModel.
* **Service Layer Isolation:** Encapsulated file system read/write logic into a separate `PathStore` worker class, keeping the UI and ViewModel layer clean of serialization boilerplate.
* **Nested Observation:** Composed an observed hierarchy by embedding the `PathStore` class inside the `CartViewModel` container, allowing SwiftUI to lazily track granular property dependencies.
* **Navigation State Saving:** Practiced saving type-erased navigation historical data across application life cycles using the native `.codable` wrapper property.

🔗 **[Full project description here](https://www.hackingwithswift.com/100/swiftui/43)**
