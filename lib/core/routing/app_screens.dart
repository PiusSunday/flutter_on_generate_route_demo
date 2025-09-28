import '../../features/about/about_screen.dart';
import '../../features/contact/contact_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../common/page_not_found.dart';
import '../models/screen_entity.dart';

import 'route_names.dart';

/// Central registry of all application screens
/// This class maintains a list of all available screens and their routes
class AppScreens {
  // Private constructor to prevent instantiation
  AppScreens._();

  /// Returns a list of all available screen entities
  /// Each entity contains a route name and its corresponding screen widget
  static List<ScreenEntity> get allScreens {
    return [
      // Splash Screen - Entry point of the application
      const ScreenEntity(routeName: RouteNames.splash, screen: SplashScreen()),

      // Home Screen - Main dashboard
      const ScreenEntity(routeName: RouteNames.home, screen: HomeScreen()),

      // About Screen - Information about the app
      const ScreenEntity(routeName: RouteNames.about, screen: AboutScreen()),

      // Contact Screen - Contact information
      const ScreenEntity(
        routeName: RouteNames.contact,
        screen: ContactScreen(),
      ),

      // Profile Screen - User profile information
      const ScreenEntity(
        routeName: RouteNames.profile,
        screen: ProfileScreen(),
      ),

      // Error Screen - Displayed when route is not found
      const ScreenEntity(
        routeName: RouteNames.pageNotFound,
        screen: PageNotFound(),
      ),
    ];
  }

  /// Find a screen entity by route name
  /// Returns null if no screen is found for the given route
  static ScreenEntity? findScreenByRoute(String routeName) {
    try {
      return allScreens.firstWhere(
        (screenEntity) => screenEntity.routeName == routeName,
      );
    } catch (e) {
      return null;
    }
  }

  /// Get all route names as a list
  static List<String> get allRouteNames {
    return allScreens.map((screen) => screen.routeName).toList();
  }

  /// Validate if a route exists in our screens registry
  static bool routeExists(String routeName) {
    return allRouteNames.contains(routeName);
  }
}
