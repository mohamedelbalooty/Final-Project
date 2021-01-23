import 'package:flutter/material.dart';
Widget buildHomeCircle({double size, Color color}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(100),
    ),
  );
}