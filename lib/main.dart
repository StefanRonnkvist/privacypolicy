import 'package:flutter/material.dart';
import 'package:privacypolicy/splash_screen.dart';

/// Starts the Flutter application with [MainApp] as the root widget.
void main() {
  runApp(const MainApp());
}

/// Configures the application-wide Material shell and initial screen.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /// Builds the Material app and makes the splash screen its first route.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
