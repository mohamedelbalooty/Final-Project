import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:final_project/app_approach/view/user_view/user_home_view.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_profile_view.dart';
import 'user_sharing_rides_view.dart';

class UserHomeNavigation extends StatefulWidget {
  static String id = 'UserHomeNavigation';

  @override
  _UserHomeNavigationState createState() => _UserHomeNavigationState();
}

class _UserHomeNavigationState extends State<UserHomeNavigation> {
  final PageController _pageController = PageController();

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
      children: [
        UserHomeView(uId: Provider.of<AuthenticationResult>(context, listen: false).userId,),
        UserSharingRidesView(),
        UserProfileView(),
      ],
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
                ? Icons.directions
                : Icons.directions_outlined),
            title: Center(child: Text('الطرق المشتركة', style: TextStyle(fontSize: 11),)),
            activeColor: Colors.green),
        BottomNavyBarItem(
            icon:
                Icon(_currentIndex == 3 ? Icons.person : Icons.person_outline),
            title: Text('الملف الشخصي', style: TextStyle(fontSize: 11),),
            activeColor: Colors.indigoAccent),
      ],
    );
  }
}
