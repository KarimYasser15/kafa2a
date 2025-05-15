import 'package:flutter/material.dart';
import 'package:kafa2a/features/auth/login/view/login_screen.dart';
import 'package:kafa2a/features/auth/register/view/user_register_screen.dart';
import 'package:kafa2a/features/home/view/provider/provider_home_screen.dart';
import 'package:kafa2a/features/home/view/user_home_screen.dart';
import 'package:kafa2a/features/offers/user/view/user_offers_screen.dart';
import 'package:kafa2a/features/onboarding/onboarding_screen.dart';
import 'package:kafa2a/features/profile-details/view/provider_profile_details.dart';

class RoutesManager {
  static const String onBoarding = '/onboarding';
  static const String login = "/login";
  static const String registerUser = "/registerUser";
  static const String homeUser = "/homeUser";
  static const String homeProvider = "/homeProvider";
  static const String offerUser = "/offerUser";
  static const String providerProfileDetails = "/providerProfileDetails";
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
      case registerUser:
        return MaterialPageRoute(
          builder: (context) => UserRegisterScreen(),
        );
      case homeUser:
        return MaterialPageRoute(
          builder: (context) => UserHomeScreen(),
        );
      case homeProvider:
        return MaterialPageRoute(
          builder: (context) => ProviderHomeScreen(),
        );
      case offerUser:
        return MaterialPageRoute(
          builder: (context) => UserOffersScreen(),
        );
      case providerProfileDetails:
        return MaterialPageRoute(
          builder: (context) => ProviderProfileDetails(),
        );
    }
    return null;
  }
}
