import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customAuthenticationButton(double width, String buttonTitle, List<Color> gradient){
  return Container(
    height: 45.0,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradient,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Center(
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: KWhiteColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

