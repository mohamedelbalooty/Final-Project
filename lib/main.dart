import 'package:final_project/app_approach/view/shared_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_approach/view/driver_view/driver_home_navigation.dart';
import 'app_approach/view/user_view/user_home_navigation.dart';
import 'provider/addRides.dart';
import 'routs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddRides>(create: (context) => AddRides(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Final Project',
        initialRoute: SplashView.id,
        theme: ThemeData(
          fontFamily: 'Tajawal',
          primarySwatch: Colors.indigo,
        ),
        routes: routs,
      ),
    );
  }
}
