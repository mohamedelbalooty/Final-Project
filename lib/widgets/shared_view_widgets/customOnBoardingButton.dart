import 'package:flutter/material.dart';

Widget buildOnboardButton({IconData icon ,Color iconColor,Color buttonColor}){
  return Container(
    width: 50,
    height: 40,
    decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3)
        ]),
    child: Icon(
      icon,
      color: iconColor,
      size: 25.0,
    ),
  );
}