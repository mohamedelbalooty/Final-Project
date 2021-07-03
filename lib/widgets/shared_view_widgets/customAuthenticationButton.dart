import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customAuthenticationButton(double width, String buttonTitle, List<Color> gradient, onClick){
  return InkWell(
    onTap: onClick,
    child: Container(
      height: 50.0,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 5.0),
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
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

