import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
//        initialRoute: DriverProfileView.id,
        initialRoute: UserHomeNavigation.id,
        theme: ThemeData(
          fontFamily: 'Tajawal',
          primarySwatch: Colors.indigo,
        ),
        routes: routs,
      ),
    );
  }
}
