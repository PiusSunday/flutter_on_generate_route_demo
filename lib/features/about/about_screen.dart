import 'package:flutter/material.dart';

/// About screen displaying information about the demo application
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.info, size: 48, color: Colors.green.shade600),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About This Demo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'onGenerateRoute Implementation',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'What is onGenerateRoute?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'onGenerateRoute is a Flutter property that allows you to dynamically generate routes based on RouteSettings. This approach provides better modularity and scalability compared to static route definitions.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Benefits
            const Text(
              'Benefits:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ..._buildBenefitsList(),
            const SizedBox(height: 16),

            // Implementation details
            const Text(
              'Implementation Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ..._buildImplementationDetails(),
            const SizedBox(height: 24),

            // Back button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBenefitsList() {
    final benefits = [
      'Centralized route management',
      'Better error handling for unknown routes',
      'Consistent navigation experience',
      'Easy to maintain and scale',
      'No third-party dependencies required',
    ];

    return benefits
        .map(
          (benefit) => Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(benefit, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildImplementationDetails() {
    final details = [
      'RouteNames class for centralized route constants',
      'ScreenEntity model for route-screen mapping',
      'AppScreens registry for all available screens',
      'AppRouting with custom page transitions',
      'Graceful handling of unknown routes',
    ];

    return details
        .map(
          (detail) => Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.code, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(detail, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
