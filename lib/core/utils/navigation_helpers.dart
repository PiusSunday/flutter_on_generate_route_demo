import 'package:flutter/material.dart';

class AppRoutingHelpers {
  /// Helper method to navigate to a route
  /// This is a convenience method for cleaner navigation calls
  static Future<T?> navigateTo<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  /// Helper method to replace current route
  static Future<T?> navigateAndReplace<T extends Object?, TO extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      context,
      routeName,
      arguments: arguments,
    );
  }

  /// Helper method to clear stack and navigate to a route
  static Future<T?> navigateAndClearStack<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
