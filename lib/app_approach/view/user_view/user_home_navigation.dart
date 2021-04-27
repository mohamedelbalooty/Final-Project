import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:final_project/app_approach/view/driver_view/driver_notification_view.dart';
import 'package:final_project/app_approach/view/user_view/user_home_view.dart';
import 'package:flutter/material.dart';
import 'user_profile_view.dart';

class UserHomeNavigation extends StatefulWidget {
  static String id = 'UserHomeNavigation';

  @override
  _UserHomeNavigationState createState() => _UserHomeNavigationState();
}

class _UserHomeNavigationState extends State<UserHomeNavigation> {
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    UserHomeView(),
    UserProfileView(),
    DriverNotificationView(),
  ];

  int _currentIndex = 0;

//  void _onPageChanged(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(
//        builder: (context) => _screens[index],
//      ),
//    );
//  }

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
        body: customPageView(), bottomNavigationBar: _customBottomNavyBar());
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
          title: Text('Home'),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: Icon(_currentIndex == 1
                ? Icons.directions
                : Icons.directions_outlined),
            title: Text('Rides'),
            activeColor: Colors.green),
        BottomNavyBarItem(
            icon: Icon(_currentIndex == 2 ? Icons.help : Icons.help_outline),
            title: Text('Help'),
            activeColor: Colors.orange),
        BottomNavyBarItem(
            icon:
                Icon(_currentIndex == 3 ? Icons.person : Icons.person_outline),
            title: Text('Settings'),
            activeColor: Colors.indigoAccent),
      ],
    );
  }
}

//bottomNavigationBar: Align(
//alignment: Alignment.bottomCenter,
//child: Container(
//height: 60,
//child: RollingNavBar.iconData(
//onTap: _onItemTapped,
//animationCurve: Curves.easeOut,
//// `easeOut` (the default) is recommended here
//animationType: AnimationType.roll,
//baseAnimationSpeed: 200,
//indicatorColors: <Color>[
//Colors.red,
//Colors.yellow,
//Colors.blue,
//],
//iconData: <IconData>[
//Icons.water_damage_outlined,
//Icons.person_outline,
//Icons.directions,
//],
//),
//),
//),
