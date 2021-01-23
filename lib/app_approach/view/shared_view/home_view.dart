import 'package:final_project/app_approach/view/driver_view/driver_signUp_view.dart';
import 'package:final_project/app_approach/view/user_view/user_signUp_view.dart';
import 'package:final_project/widgets/shared_view_widgets/customHomeButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customHomeCircle.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomeView extends StatelessWidget {
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
   /* double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;*/
    return Scaffold(
      body: Center(
        child: Container(
          color:  KMainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                'MR',
                style: TextStyle(fontSize: 50, color: KWhiteColor),
              ),
              Text(
                'Connect and disvery our',
                style: TextStyle(color: KWhiteColor),
              ),
              Text(
                'awesome UI Kit',
                style: TextStyle(color: KWhiteColor),
              ),
              SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  buildHomeCircle(
                    size: 150,
                    color: KSecondColor,
                  ),
                  Positioned(
                    left: 25,
                    top: 25,
                    child: buildHomeCircle(
                      size: 100,
                      color:  KMainColor,
                    ),
                  ),
                  Positioned(
                      left: 55,
                      top: 55,
                      child: Icon(
                        Icons.close,
                        color: KWhiteColor,
                        size: 40,
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                  'Lorem ipsum dolor sit amet,consect adipiscing\nsed do eiusmod tempor incididunt ut labore etc.',
                  style: TextStyle(color: KWhiteColor)),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildHomeButton(
                      title: 'Driver',
                      titleColor: KWhiteColor,
                      buttonColor: KSecondColor,
                      borderColor: KSecondColor,
                      context: context,
                      nextScreen: DriverSignUpView()),
                  SizedBox(
                    width: 15,
                  ),
                  buildHomeButton(
                      title: 'User',
                      titleColor: KWhiteColor,
                      borderColor: KWhiteColor,
                      context: context,
                      nextScreen: UserSignUpView()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
