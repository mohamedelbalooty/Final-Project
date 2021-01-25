import 'package:final_project/widgets/shared_view_widgets/customCliper.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customBackground(
    bool isPortrait, double height, double width, String image) {
  return Stack(
    children: [
      ClipPath(
        clipper: CustomClip2(isPortrait: isPortrait),
        child: Container(
          height: isPortrait ? height * 0.38 : height * 0.7,
          width: width,
          color: KOrangeColor,
        ),
      ),
      ClipPath(
        clipper: CustomClip1(isPortrait: isPortrait),
        child: Container(
          height: isPortrait ? height * 0.36 : height * 0.6,
          width: width,
          color: KSecondColor,
          child: Hero(
            child: Image.asset('assets/images/photos/$image.png'),
            tag: 'Asset',
          ),
        ),
      ),
    ],
  );
}
