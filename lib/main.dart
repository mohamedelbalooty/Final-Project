import 'package:flutter/material.dart';
import 'app_approach/view/driver_view/driver_profile_view.dart';
import 'app_approach/view/driver_view/driver_signIn_view.dart';
import 'app_approach/view/driver_view/driver_signUp_view.dart';
import 'app_approach/view/shared_view/home_view.dart';
import 'app_approach/view/shared_view/onboarding_view.dart';
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
      // initialRoute: SplashView.id,
      initialRoute: OnBoardingView.id,
      // initialRoute: UserSignInView.id,
      routes: {
        SplashView.id: (context) => SplashView(),
        OnBoardingView.id: (context) => OnBoardingView(),
        HomeView.id: (context) => HomeView(),
        UserSignInView.id: (context) => UserSignInView(),
        UserSignUpView.id: (context) => UserSignUpView(),
        UserProfileView.id: (context) => UserProfileView(),
        DriverSignInView.id: (context) => DriverSignInView(),
        DriverSignUpView.id: (context) => DriverSignUpView(),
        DriverProfileView.id: (context) => DriverProfileView(),
      },
    );
  }
}
