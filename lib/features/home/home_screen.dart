import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../core/utils/navigation_helpers.dart';

/// Home screen - main dashboard of the application
/// Contains navigation options to other screens
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome message
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.home, size: 48, color: Colors.blue.shade600),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome to onGenerateRoute Demo!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This demo shows how to implement modular routing in Flutter without third-party plugins.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Navigation options
            const Text(
              'Navigation Options:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            // About button
            _NavigationCard(
              title: 'About',
              subtitle: 'Learn more about this demo app',
              icon: Icons.info_outline,
              color: Colors.green,
              onTap: () =>
                  AppRoutingHelpers.navigateTo(context, RouteNames.about),
            ),
            const SizedBox(height: 12),

            // Contact button
            _NavigationCard(
              title: 'Contact',
              subtitle: 'Get in touch with us',
              icon: Icons.contact_mail,
              color: Colors.orange,
              onTap: () =>
                  AppRoutingHelpers.navigateTo(context, RouteNames.contact),
            ),
            const SizedBox(height: 12),

            // Profile button
            _NavigationCard(
              title: 'Profile',
              subtitle: 'View and edit your profile',
              icon: Icons.person,
              color: Colors.purple,
              onTap: () =>
                  AppRoutingHelpers.navigateTo(context, RouteNames.profile),
            ),
            const SizedBox(height: 24),

            // Test unknown route button
            ElevatedButton.icon(
              onPressed: () {
                // Demonstrate handling unknown routes
                Navigator.pushNamed(context, '/unknown-route');
              },
              icon: const Icon(Icons.error_outline),
              label: const Text('Test Unknown Route'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom widget for navigation cards
class _NavigationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _NavigationCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
