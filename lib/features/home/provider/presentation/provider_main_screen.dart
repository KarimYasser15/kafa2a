import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
    Scaffold(
      backgroundColor: Colors.deepOrange,
    ),
    ProviderProfileScreen()
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
                  icon: Icon(Icons.edit_document),
                  label: AppLocalizations.of(context).myRequests),
              BottomNavigationBarItem(
                  icon: Icon(Icons.handshake),
                  label: AppLocalizations.of(context).accepted),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: AppLocalizations.of(context).chats,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: AppLocalizations.of(context).myProfile),
            ]),
      ),
    );
  }
}
