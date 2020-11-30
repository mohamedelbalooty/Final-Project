import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static String id = 'SplashView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash view'),
      ),
    );
  }
}
