import 'package:flutter/material.dart';

/// Entity class that represents a screen with its route name and widget
/// This helps in organizing screens and their corresponding routes
class ScreenEntity {
  /// The route name used for navigation
  final String routeName;

  /// The widget/screen to be displayed
  final Widget screen;

  /// Optional arguments that can be passed to the screen
  final Object? arguments;

  const ScreenEntity({
    required this.routeName,
    required this.screen,
    this.arguments,
  });

  /// Create a copy of this entity with updated values
  ScreenEntity copyWith({
    String? routeName,
    Widget? screen,
    Object? arguments,
  }) {
    return ScreenEntity(
      routeName: routeName ?? this.routeName,
      screen: screen ?? this.screen,
      arguments: arguments ?? this.arguments,
    );
  }

  @override
  String toString() {
    return 'ScreenEntity{routeName: $routeName, screen: ${screen.runtimeType}, arguments: $arguments}';
  }
}
