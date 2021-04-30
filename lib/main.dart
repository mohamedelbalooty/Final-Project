import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'app_approach/view/driver_view/driver_home_navigation.dart';
import 'app_approach/view/driver_view/driver_notification_view.dart';
import 'app_approach/view/driver_view/driver_profile_view.dart';
import 'app_approach/view/driver_view/driver_signIn_view.dart';
import 'app_approach/view/driver_view/driver_signUp_view.dart';
import 'app_approach/view/shared_view/home_view.dart';
import 'app_approach/view/shared_view/onboarding_view.dart';
import 'app_approach/view/user_view/user_home_navigation.dart';
import 'app_approach/view/user_view/user_home_view.dart';
import 'app_approach/view/user_view/user_onTrip_view.dart';
import 'app_approach/view/user_view/user_payment_view.dart';
import 'app_approach/view/user_view/user_profile_view.dart';
import 'app_approach/view/user_view/user_signIn_view.dart';
import 'app_approach/view/user_view/user_signUp_view.dart';
import 'app_approach/view/shared_view/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final Project',
      initialRoute: UserHomeNavigation.id,
      theme: ThemeData(
        fontFamily: 'BalooTamma2',
        primarySwatch: Colors.indigo,
      ),
      //initialRoute: OnBoardingView.id,
      // initialRoute: UserSignInView.id,
      routes: {
        SplashView.id: (context) => SplashView(),
        OnBoardingView.id: (context) => OnBoardingView(),
        HomeViewShared.id: (context) => HomeViewShared(),
        UserSignInView.id: (context) => UserSignInView(),
        UserSignUpView.id: (context) => UserSignUpView(),
        UserProfileView.id: (context) => UserProfileView(),
        DriverSignInView.id: (context) => DriverSignInView(),
        DriverSignUpView.id: (context) => DriverSignUpView(),
        DriverProfileView.id: (context) => DriverProfileView(),
        DriverHomeNavigation.id: (context) => DriverHomeNavigation(),
        DriverNotificationView.id: (context) => DriverNotificationView(),
        UserHomeNavigation.id: (context) => UserHomeNavigation(),
        UserHomeView.id: (context) => UserHomeView(),
        UserPaymentView.id: (context) => UserPaymentView(),
        UserOnTripView.id: (context) => UserOnTripView(),
      },
    );
  }
}
