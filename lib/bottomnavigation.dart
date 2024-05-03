import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smartcampusloginpage/attendence.dart';
import 'package:smartcampusloginpage/examhome.dart';
import 'package:smartcampusloginpage/fees.dart';
import 'package:smartcampusloginpage/personalscreen.dart';
import 'package:smartcampusloginpage/profilpage.dart';

import 'homescreen.dart';

class NavigationBar1 extends StatelessWidget {
  NavigationBar1({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildScreens() {
      return [
        ExamPage(),
        Attendance(),
        HomePage(),
        FeePaymentScreen(),
        ProfileScreen(),

      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.check_box_outlined),
          title: ("Exam"),
          activeColorPrimary:Color(0xff6D4DBF),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.checklist_rtl),
          title: ("Attendance"),
          activeColorPrimary: Color(0xff6D4DBF),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home,color: Colors.white,),
          title: ("Home"),
          activeColorPrimary: Color(0xff6D4DBF),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.wallet),
          title: ("Fee"),
          activeColorPrimary: Color(0xff6D4DBF),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: Color(0xff6D4DBF),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),

      ];
    }
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 2);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(

          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[300]!))
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      // Choose the nav bar style with this property.
    );
  }
}