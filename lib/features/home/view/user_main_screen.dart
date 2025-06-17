import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:kafa2a/config/strings_manager.dart';
import 'package:kafa2a/features/accepted_requests/view/accepted_requests_screen.dart';
import 'package:kafa2a/features/my_profile/presentation/my_profile_screen.dart';
import 'package:kafa2a/features/requests/user/view/screens/user_requests_screen.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int selectedTab = 0;
  List<Widget> tabs = [
    Scaffold(
      backgroundColor: Colors.green,
    ),
    UserRequestsScreen(),
    AcceptedRequestsScreen(),
    Scaffold(
      backgroundColor: Colors.deepOrange,
    ),
    MyProfileScreen()
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
                label: StringsManager.home,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_document),
                  label: StringsManager.myRequests),
              BottomNavigationBarItem(
                  icon: Icon(Icons.handshake), label: StringsManager.accepted),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: StringsManager.chats,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: StringsManager.myProfile),
            ]),
      ),
    );
  }
}
