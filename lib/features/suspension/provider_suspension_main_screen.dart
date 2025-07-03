import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:kafa2a/features/my_profile/presentation/screens/provider/provider_profile_screen.dart';
import 'package:kafa2a/features/suspension/provider_suspension_home_tab.dart';
import 'package:kafa2a/l10n/languages/app_localizations.dart';

class ProviderSuspensionMainScreen extends StatefulWidget {
  const ProviderSuspensionMainScreen({super.key});

  @override
  State<ProviderSuspensionMainScreen> createState() =>
      _ProviderSuspensionMainScreenState();
}

class _ProviderSuspensionMainScreenState
    extends State<ProviderSuspensionMainScreen> {
  int selectedTab = 0;
  List<Widget> tabs = [
    ProviderSuspensionHomeTab(),
    ProviderProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[selectedTab],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
        child: BottomNavigationBar(
            onTap: (value) {
              selectedTab = value;
              setState(() {});
            },
            currentIndex: selectedTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppLocalizations.of(context).home,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: AppLocalizations.of(context).myProfile),
            ]),
      ),
    );
  }
}
