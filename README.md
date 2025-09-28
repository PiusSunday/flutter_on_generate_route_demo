# Modular-Efficient Routing in Flutter: onGenerateRoute Demo

A clean, modular, and scalable routing solution for Flutter applications, implemented using the built-in `onGenerateRoute` property, eliminating the need for external routing packages.

This demo project demonstrates best practices for implementing navigation in Flutter applications using the built-in `onGenerateRoute` method. It provides a scalable, maintainable, and modular approach to routing that grows with your application.

## Who Is This For?

This project serves as a practical, intermediate-level demo for developers looking to master scalable navigation in Flutter.

## ✨ The Core Philosophy

Traditional Flutter routing using the `routes` map in `MaterialApp` quickly becomes unmanageable and unmaintainable in large applications. This demo follows a **modular, three-step approach** to centralize and simplify navigation logic:

1. **Centralized Route Names:** All route names are defined as constants in `RouteNames.allRoutes` (`route_names.dart`).
2. **Route Registration and Centralized Screen Entities**: Route names are mapped to their screen widgets in one place and all screens are registered in `AppScreens.allScreens` (`app_screens.dart`) which helps in avoiding large `switch` statements in the routing function.
3. **Route Generation**: The `AppRouting.generateRouteSettings()` (`app_routing.dart`) function handles route creation requests, performing lookups, applying common logic (like authentication checks in a real app), and providing graceful error handling (`PageNotFound`) (`page_not_found.dart`).

## 🛠️ Features

- **Centralized Route Management**: All routes defined in a single location
- **Modular Architecture**: Clean separation of concerns
- **Error Handling**: **Error Handling**: Unknown routes are gracefully handled with a custom error page (`PageNotFound`) (`page_not_found.dart`).
- **Custom Navigation**: Methods in the `AppRoutingHelpers` (`navigation_helpers.dart`) class provide a convenient & clean API for navigating between screens and routes, encapsulating the navigation logic.
- **No Third-Party Dependencies**: Uses only Flutter's built-in navigation
- **Type Safety**: Compile-time route validation
- **Easy Debugging**: Comprehensive logging for navigation events

## 🎯 Key Components

### 1. RouteNames

Centralized constants for all route names, ensuring consistency and preventing typos.

### 2. ScreenEntity

Model class that maps route names to their corresponding screen widgets.

### 3. AppScreens

Registry that maintains all available screens and provides utility methods for route lookup.

### 4. AppRouting

Core routing logic with custom page transitions and error handling.

### 5. AppRoutingHelpers

Utility class providing static methods for navigation actions, encapsulating the navigation logic.

### 6. PageNotFound

A simple error page displayed when an unknown route is accessed.

## 📚 Usage Examples

### Basic Navigation

```dart
// Navigate to about screen
Navigator.pushNamed(context, RouteNames.about);

// Or use the helper method
AppRoutingHelper.navigateTo(context, RouteNames.about);
```

### Navigation with Arguments

```dart
// Navigate to profile screen with arguments
Navigator.pushNamed(
  context,
  RouteNames.profile,
  arguments: {'userId': '123'},
);

// Or use the helper method
AppRoutingHelpers.navigateTo(
  context,
  RouteNames.profile,
  arguments: {'userId': '123'},
);
```

### Replace Current Route

```dart
AppRoutingHelpers.navigateAndReplace(context, RouteNames.home);
```

### Clear Stack and Navigate

```dart
AppRoutingHelpers.navigateAndClearStack(context, RouteNames.home);
```

## 🎨 Custom Transitions

The demo includes custom fade transitions for all routes. You can easily modify the transition animation in the `_customPageBuilder` method within `AppRouting`.

## ❌ Testing Unknown Routes

The home screen includes a "Test Unknown Route" button that demonstrates how the app handles invalid routes by showing a user-friendly error page.

## 📖 Learning Objectives

This demo helps you understand:

- How `onGenerateRoute` works in Flutter
- Benefits over static route definitions
- Implementing modular routing architecture
- Error handling in navigation
- Custom page transitions
- Best practices for route management

## 🚀 How to Run

1. Clone the repository:

    ```bash
    git clone [https://github.com/PiusSunday/flutter_on_generate_route_demo.git](https://github.com/PiusSunday/flutter_on_generate_route_demo.git)
    ```

2. Navigate to the project directory:

    ```bash
    cd flutter_on_generate_route_demo
    ```

3. Fetch dependencies:

    ```bash
    flutter pub get
    ```

4. Run the application:

    ```bash
    flutter run
    ```

## 🤝 Contributing

This is a demo project for educational purposes. Feel free to fork and experiment with different routing patterns!

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/PiusSunday/flutter_on_generate_route_demo/blob/main/LICENSE) file for details.
