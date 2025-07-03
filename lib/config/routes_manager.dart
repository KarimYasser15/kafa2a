import 'package:flutter/material.dart';
import 'package:kafa2a/features/auth/presentation/screens/login/login_screen.dart';
import 'package:kafa2a/features/auth/presentation/screens/register/provider_register_screen.dart';
import 'package:kafa2a/features/auth/presentation/screens/register/user_register_screen.dart';
import 'package:kafa2a/features/home/provider/presentation/provider_main_screen.dart';
import 'package:kafa2a/features/home/user/presentation/screens/request_service_screen.dart';
import 'package:kafa2a/features/home/user/presentation/screens/user_main_screen.dart';
import 'package:kafa2a/features/offers/user/presentation/screens/user_offers_screen.dart';
import 'package:kafa2a/features/onboarding/onboarding_screen.dart';
import 'package:kafa2a/features/profile-details/view/provider_profile_details.dart';
import 'package:kafa2a/features/suspension/provider_suspension_main_screen.dart';

class RoutesManager {
  static const String onBoarding = '/onboarding';
  static const String login = "/login";
  static const String registerUser = "/registerUser";
  static const String registerProvider = "/registerProvider";
  static const String homeSuspendedProvider = "/homeSuspendedProvider";
  static const String homeUser = "/homeUser";
  static const String homeProvider = "/homeProvider";
  static const String offerUser = "/offerUser";
  static const String providerProfileDetails = "/providerProfileDetails";
  static const String requestAService = "/requestAService";
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
      case registerProvider:
        return MaterialPageRoute(
          builder: (context) => ProviderRegisterScreen(),
        );
      case homeUser:
        return MaterialPageRoute(
          builder: (context) => UserMainScreen(),
        );
      case homeProvider:
        return MaterialPageRoute(
          builder: (context) => ProviderMainScreen(),
        );
      case offerUser:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => UserOffersScreen(),
        );
      case requestAService:
        return MaterialPageRoute(
          builder: (context) => RequestServiceScreen(),
        );
      case homeSuspendedProvider:
        return MaterialPageRoute(
          builder: (context) => ProviderSuspensionMainScreen(),
        );
    }
    return null;
  }
}
