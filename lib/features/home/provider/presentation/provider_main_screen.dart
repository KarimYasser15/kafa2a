import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:kafa2a/core/widgets/custom_navigation_bar.dart';
import 'package:kafa2a/features/accepted_requests/view/accepted_requests_screen.dart';
import 'package:kafa2a/features/home/provider/presentation/screens/provider_home_tab.dart';
import 'package:kafa2a/features/my_profile/presentation/screens/provider/provider_profile_screen.dart';
import 'package:kafa2a/features/requests/user/presentation/screens/user_requests_screen.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ProviderMainScreen extends StatefulWidget {
  const ProviderMainScreen({super.key});

  @override
  State<ProviderMainScreen> createState() => _ProviderMainScreenState();
}

class _ProviderMainScreenState extends State<ProviderMainScreen> {
  int selectedTab = 0;
  List<Widget> tabs = [
    ProviderHomeTab(),
    UserRequestsScreen(),
    AcceptedRequestsScreen(),
    ProviderProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[selectedTab],
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: selectedTab,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        isProvider: true,
      ),
    );
  }
}
