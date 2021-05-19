import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:final_project/app_approach/view/driver_view/driver_notification_view.dart';
import 'package:final_project/life_tracking/ride_location_tracker.dart';
import 'package:flutter/material.dart';
import 'driver_home_view.dart';
import 'driver_profile_view.dart';

class DriverHomeNavigation extends StatefulWidget {
  static const String id = 'DriverHomeNavigation';

  @override
  _DriverHomeNavigationState createState() => _DriverHomeNavigationState();
}

class _DriverHomeNavigationState extends State<DriverHomeNavigation> {
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    DriverHomeView(),
    DriverNotificationView(),
    DriverProfileView(),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
    _pageController.animateToPage(selectedIndex,
        curve: Curves.easeIn, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: customPageView(), bottomNavigationBar: _customBottomNavyBar()),
    );
  }

  PageView customPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: _screens,
    );
  }

  BottomNavyBar _customBottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      onItemSelected: _onItemTapped,
      items: [
        BottomNavyBarItem(
          icon: Icon(
              _currentIndex == 0 ? Icons.home : Icons.water_damage_outlined),
          title: Center(child: Text('الرئيسية')),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: Icon(_currentIndex == 1
                ? Icons.notifications
                : Icons.notifications_none),
            title: Center(child: Text('الاشعارات'),),
            activeColor: Colors.orange),
        BottomNavyBarItem(
            icon: Icon(_currentIndex == 2 ? Icons.person : Icons.person_outline),
            title: Center(child: Text('الملف الشخصي', style: TextStyle(fontSize: 12),),),
            activeColor: Colors.indigoAccent),
      ],
    );
  }
}