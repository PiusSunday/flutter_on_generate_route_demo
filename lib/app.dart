import 'package:flutter/material.dart';

import 'core/routing/app_routing.dart' show AppRouting;
import 'core/routing/route_names.dart' show RouteNames;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OnGenRoute",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Set the initial route - entry point of the app
      initialRoute: RouteNames.splash,

      // Use our custom route generator for all navigation
      onGenerateRoute: AppRouting.generateRouteSettings,

      // Handle unknown routes gracefully
      onUnknownRoute: (settings) => AppRouting.generateRouteSettings(
        const RouteSettings(name: RouteNames.pageNotFound),
      ),
    );
  }
}
