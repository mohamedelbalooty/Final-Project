import 'package:final_project/provider/addNewPassenger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_approach/controller/api_services.dart';
import 'app_approach/view/shared_view/splash_view.dart';
import 'provider/addRides.dart';
import 'provider/authentication_result.dart';
import 'provider/modalHud.dart';
import 'provider/onClick.dart';
import 'routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddRides>(
          create: (context) => AddRides(),
        ),
        ChangeNotifierProvider<ModalHud>(
          create: (context) => ModalHud(),
        ),
        ChangeNotifierProvider<AuthenticationResult>(
          create: (context) => AuthenticationResult(),
        ),
        ChangeNotifierProvider<ApiService>(
          create: (context) => ApiService(),
        ),
        ChangeNotifierProvider<OnClick>(
          create: (context) => OnClick(),
        ),
        ChangeNotifierProvider<AddNewPassenger>(
          create: (context) => AddNewPassenger(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'توصيلة',
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
