import 'package:flutter/material.dart';
import 'package:kafa2a/features/auth/login/view/login_screen.dart';
import 'package:kafa2a/features/onboarding/onboarding_screen.dart';

class RoutesManager {
  static const String onBoarding = '/onboarding';
  static const String login = "/login";
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
    }
    return null;
  }
}
