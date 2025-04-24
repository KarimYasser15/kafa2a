import 'package:flutter/material.dart';
import 'package:kafa2a/features/onboarding/onboarding_screen.dart';

class RoutesManager {
  static const String onBoarding = '/onboarding';
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
    }
    return null;
  }
}
