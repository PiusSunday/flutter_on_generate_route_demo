import 'package:flutter/material.dart';
import '../common/page_not_found.dart';
import '../models/screen_entity.dart';
import 'route_names.dart';
import 'app_screens.dart';

/// Central routing manager that handles all navigation logic
/// This class uses onGenerateRoute to create routes dynamically
class AppRouting {
  // Private constructor to prevent instantiation
  AppRouting._();

  /// Custom page builder that creates routes with fade transition
  /// This provides a consistent navigation experience across the app
  static PageRouteBuilder<dynamic> _customPageBuilder({
    required Widget screen,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder<dynamic>(
      // The actual screen widget to display
      pageBuilder: (context, animation, secondaryAnimation) => screen,

      // Route settings containing name and arguments
      settings: settings,

      // Duration for the transition animation
      transitionDuration: const Duration(milliseconds: 300),

      // Reverse transition duration when navigating back
      reverseTransitionDuration: const Duration(milliseconds: 200),

      // Custom transition animation - fade in/out effect
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  /// Main route generator function used by onGenerateRoute
  /// This function is called whenever Navigator.pushNamed() is used
  static Route<dynamic> generateRouteSettings(RouteSettings settings) {
    final String? routeName = settings.name;

    // Log route generation for debugging purposes
    debugPrint('🚀 Generating route for: $routeName');

    // Handle null or empty route names
    if (routeName == null || routeName.isEmpty) {
      debugPrint('❌ Route name is null or empty, redirecting to PageNotFound');
      return _customPageBuilder(
        screen: const PageNotFound(),
        settings: RouteSettings(
          name: RouteNames.pageNotFound,
          arguments: settings.arguments,
        ),
      );
    }

    // Try to find the screen entity for the requested route
    final ScreenEntity? screenEntity = AppScreens.findScreenByRoute(routeName);

    if (screenEntity != null) {
      // Route found - create and return the page
      debugPrint('✅ Route found: ${screenEntity.routeName}');
      return _customPageBuilder(
        screen: screenEntity.screen,
        settings: settings,
      );
    } else {
      // Route not found - redirect to error page
      debugPrint('❌ Route not found: $routeName, redirecting to PageNotFound');
      return _customPageBuilder(
        screen: const PageNotFound(),
        settings: RouteSettings(
          name: RouteNames.pageNotFound,
          arguments: {
            'requestedRoute': routeName,
            'originalArguments': settings.arguments,
          },
        ),
      );
    }
  }
}
