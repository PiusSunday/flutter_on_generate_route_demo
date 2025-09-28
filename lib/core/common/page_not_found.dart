import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../core/utils/navigation_helpers.dart';

/// Error screen displayed when a route is not found
/// This screen provides user-friendly error handling for invalid routes
class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract arguments to get the requested route that failed
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final requestedRoute = arguments?['requestedRoute'] as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
        backgroundColor: Colors.red.shade600,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Error icon
              Icon(Icons.error_outline, size: 120, color: Colors.red.shade400),
              const SizedBox(height: 24),

              // Error title
              const Text(
                'Oops! Page Not Found',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Error description
              Text(
                requestedRoute != null
                    ? 'The route "$requestedRoute" does not exist.'
                    : 'The requested page could not be found.',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              const Text(
                'This demonstrates how onGenerateRoute handles unknown routes gracefully.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Action buttons
              Column(
                children: [
                  // Go back button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          // If can't pop, go to home
                          AppRoutingHelpers.navigateAndReplace(
                            context,
                            RouteNames.home,
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Go Back'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Go to home button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        AppRoutingHelpers.navigateAndClearStack(
                          context,
                          RouteNames.home,
                        );
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Go to Home'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue.shade600,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),

              // Debug information (only in debug mode)
              if (requestedRoute != null) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Debug Information:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Requested Route: $requestedRoute',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'monospace',
                        ),
                      ),
                      if (arguments?['originalArguments'] != null)
                        Text(
                          'Arguments: ${arguments!['originalArguments']}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'monospace',
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
