import 'package:final_project/app_approach/view/driver_view/driver_signIn_view.dart';
import 'package:final_project/app_approach/view/user_view/user_signIn_view.dart';
import 'package:final_project/widgets/shared_view_widgets/customHomeButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class HomeView extends StatelessWidget {
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      children: [
        customWallpaper(height, width),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isPortrait ? 10.0 : 30.0,
                  vertical: isPortrait ? 30 : 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: isPortrait ? height * 0.6 : height * 1.5,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Hero(child: Image.asset('assets/images/photos/Asset 7.png'), tag: 'Asset',),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Welcome to in Tawseela App system',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: KWhiteColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: isPortrait ? height * 0.3 : height * 0.4,
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildHomeButton(
                            title: 'Driver',
                            buttonColor: [Colors.deepOrangeAccent, KGradientColor],
                            context: context,
                            nextScreen: DriverSignInView()),
                        buildHomeButton(
                            title: 'User',
                            buttonColor: [KGradientColor, Colors.deepOrangeAccent],
                            context: context,
                            nextScreen: UserSignInView()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
