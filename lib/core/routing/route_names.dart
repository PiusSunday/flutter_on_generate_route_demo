// Centralized class containing all route names used in the application
/// This ensures consistency and prevents typos in route navigation
class RouteNames {
  // Private constructor to prevent instantiation
  RouteNames._();

  /// Initial route - entry point of the application
  static const String splash = '/';

  /// Main application screens
  static const String home = '/home-screen';
  static const String about = '/about-screen';
  static const String contact = '/contact-screen';
  static const String profile = '/profile-screen';

  /// Error handling route
  static const String pageNotFound = '/page-not-found';

  /// List of all available routes for validation purposes
  static const List<String> allRoutes = [
    splash,
    home,
    about,
    contact,
    profile,
    pageNotFound,
  ];

  /// Check if a route name is valid
  static bool isValidRoute(String routeName) {
    return allRoutes.contains(routeName);
  }
}
