import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customLogo() {
  return Container(
    height: 85.0,
    width: 85.0,
    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    decoration: BoxDecoration(
      color: KBorderColor,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        'Logo',
        style: TextStyle(color: KWhiteColor),
      ),
    ),
  );
}
