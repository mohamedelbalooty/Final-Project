import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'driver_home_view.dart';
import 'driver_notification_view.dart';
import 'driver_profile_view.dart';

class DriverHomeNavigation extends StatefulWidget {

  static String id = 'DriverHomeNavigation';

  @override
  _DriverHomeNavigationState createState() => _DriverHomeNavigationState();
}

class _DriverHomeNavigationState extends State<DriverHomeNavigation> {
  PageController _pageController = PageController();

  List<Widget> _screens = [
    DriverHomeView(),
    DriverNotificationView(),
    DriverProfileView(),
  ];

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(selectedIndex,curve: Curves.easeIn,
        duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.home,
            title: "Home",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.notifications,
            title: "Notifier",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.person,
            title: "Profile",
          ),
        ],
      ),
    );
  }
}