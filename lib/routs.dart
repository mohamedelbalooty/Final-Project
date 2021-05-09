import 'app_approach/view/driver_view/driver_home_navigation.dart';
import 'app_approach/view/driver_view/driver_notification_view.dart';
import 'app_approach/view/driver_view/driver_profile_view.dart';
import 'app_approach/view/driver_view/driver_signIn_view.dart';
import 'app_approach/view/driver_view/driver_signUp_view.dart';
import 'app_approach/view/shared_view/home_view.dart';
import 'app_approach/view/shared_view/onboarding_view.dart';
import 'app_approach/view/user_view/user_home_view.dart';
import 'app_approach/view/user_view/user_onTrip_view.dart';
import 'app_approach/view/user_view/user_payment_view.dart';
import 'app_approach/view/user_view/user_profile_view.dart';
import 'app_approach/view/user_view/user_signIn_view.dart';
import 'app_approach/view/user_view/user_signUp_view.dart';
import 'app_approach/view/shared_view/splash_view.dart';
import 'app_approach/view/user_view/user_home_navigation.dart';

var routs = {
  SplashView.id: (_) => SplashView(),
  OnBoardingView.id: (_) => OnBoardingView(),
  HomeViewShared.id: (_) => HomeViewShared(),
  UserSignInView.id: (_) => UserSignInView(),
  UserSignUpView.id: (_) => UserSignUpView(),
  UserProfileView.id: (_) => UserProfileView(),
  DriverSignInView.id: (_) => DriverSignInView(),
  DriverSignUpView.id: (_) => DriverSignUpView(),
  DriverProfileView.id: (_) => DriverProfileView(),
  DriverHomeNavigation.id: (_) => DriverHomeNavigation(),
  DriverNotificationView.id: (_) => DriverNotificationView(),
  UserHomeNavigation.id: (_) => UserHomeNavigation(),
  UserHomeView.id: (_) => UserHomeView(),
  UserPaymentView.id: (_) => UserPaymentView(),
  UserOnTripView.id: (_) => UserOnTripView(),
};
