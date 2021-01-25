import 'dart:async';

import 'package:flutter/material.dart';
class SplashView extends StatefulWidget {
  static String id = 'SplashView';
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacementNamed(context, 'OnBoardingView');}
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/photos/splash.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/photos/logo.png', width: 160, height: 160,),
            SizedBox(height: 5,),
            Text('Tawseela', style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 28,
                fontWeight: FontWeight.w900,
            ),)
          ],
        ),
      ),
    );
  }
}