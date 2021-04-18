import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DriverProfileView extends StatelessWidget {
  static String id = 'DriverProfileView';
  final PageController _pageController = PageController();
  int currentIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/photos/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/photos/driver.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            DrawerInfo(icon: Icons.settings, txt: "Settings"),
            SizedBox(height: 20.0),
            DrawerInfo(icon: Icons.language, txt: "Language"),
            SizedBox(height: 20.0),
            DrawerInfo(icon: Icons.info, txt: "About"),
            SizedBox(height: 60),
            DrawerInfo(icon: Icons.logout, txt: "Sign Out"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/photos/background.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/photos/driver.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Lukas",
              style: TextStyle(
                fontSize: 28.0,
                letterSpacing: 2.0,
                color: KGradientColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.email, color: Colors.blue, size: 25.0),
                    SizedBox(height: 26.0),
                    Icon(Icons.phone, color: Colors.blue, size: 25.0),
                    SizedBox(height: 26.0),
                    Icon(Icons.drive_eta, color: Colors.blue, size: 25.0)
                  ],
                ),
                SizedBox(
                  width: 25.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'driver@gmail.com',
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      '+2010151859649',
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      '5899',
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
//      bottomNavigationBar: StatefulBuilder(
//        builder: (context, setstate){
//          return CustomBottomNavigationBar(
//            onTap: (index) {
//              setstate((){
//                currentIndex = index;
//                _pageController.animateToPage(index,
//                    curve: Curves.fastLinearToSlowEaseIn,
//                    duration: Duration(milliseconds: 600));
//                _pageController.jumpToPage(currentIndex);
//              });
//            },
//            items: [
//              CustomBottomNavigationBarItem(
//                icon: Icons.home,
//                title: "Home",
//              ),
//              CustomBottomNavigationBarItem(
//                icon: Icons.notifications,
//                title: "Notification",
//              ),
//              CustomBottomNavigationBarItem(
//                icon: Icons.person,
//                title: "Profile",
//              ),
//            ],
//          );
//        },
//      ),
    );
  }
}

class DriverInfo extends StatelessWidget {
  final String info;
  final IconData icon;

  DriverInfo({this.icon, this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: KGradientColor,
            size: 25.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            info,
            style: TextStyle(
              color: KOrangeColor,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerInfo extends StatelessWidget {
  final IconData icon;
  final String txt;
  DrawerInfo({this.icon, this.txt});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30.0),
        Icon(
          icon,
          color: Colors.grey,
          size: 25,
        ),
        SizedBox(width: 25.0),
        Text(
          txt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
