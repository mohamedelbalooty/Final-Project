import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {
  bool isPortrait;

  CustomClip({@required this.isPortrait});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, isPortrait ? size.height * 0.8 : size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2,
        isPortrait ? size.height * 1.2 : size.height * 1.3,
        size.width,
        isPortrait ? size.height * 0.8 : size.height * 0.7);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
