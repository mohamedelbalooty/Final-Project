import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customWallpaper(height, width){
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [KMainColor, KGradientColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
    ),
  );
}