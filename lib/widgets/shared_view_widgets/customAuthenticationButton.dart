import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customAuthenticationButton(double width, String buttonTitle){
  return Container(
    height: 40.0,
    width: width,
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: KSecondColor,
      borderRadius: BorderRadius.circular(30.0),
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

