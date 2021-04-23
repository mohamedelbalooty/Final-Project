import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'driver_home_view.dart';
import 'driver_notification_view.dart';
import 'driver_profile_view.dart';

class DriverHomeNavigation extends StatefulWidget {
  static String id = 'DriverHomeNavigation';

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

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
    _pageController.animateToPage(selectedIndex,
        curve: Curves.easeIn, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        onTap: _onItemTapped,
//        currentIndex: _currentIndex,
//        backgroundColor: KGradientColor,
//        fixedColor: KOrangeColor,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.home,
//                size: 28,
//              ),
//              title: Container()),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.notifications,
//                size: 28,
//              ),
//              title: Container()),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.person,
//                size: 28,
//              ),
//              title: Container()),
//        ],
//      ),

      bottomNavigationBar: CurvedNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: KGradientColor,
        color: KMainColor,
        height: 52,
        items: [
          Icon(Icons.home, size: 28, color: KOrangeColor,),
          Icon(Icons.notifications, size: 28, color: KOrangeColor,),
          Icon(Icons.person, size: 28, color: KOrangeColor,),
        ],
      ),
//      bottomNavigationBar: CustomBottomNavigationBar(
//        onTap: _onItemTapped,
//        items: [
//          CustomBottomNavigationBarItem(
//            icon: Icons.home,
//            title: 'Home',
//          ),
//
//          CustomBottomNavigationBarItem(
//            icon: Icons.notifications,
//            title: 'Notifier',
//          ),
//          CustomBottomNavigationBarItem(
//            icon: Icons.person,
//            title: 'Profile',
//          ),
//        ],
//      ),
    );
  }
}
