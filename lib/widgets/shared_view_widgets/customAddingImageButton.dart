import 'package:flutter/material.dart';

import '../../constants.dart';

Widget customAddingImageButton(Function onClick){
  return InkWell(
    onTap: onClick,
    child: Stack(
      children: [
        Container(
          height: 85.0,
          width: 85.0,
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(
                  'assets/images/icons/empty.jpg'),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: KOrangeColor, width: 1.5,),
            shape: BoxShape.circle,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 30.0,
            width: 30.0,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: KWhiteColor,
              shape: BoxShape.circle,
              border: Border.all(color: KOrangeColor, width: 1.5),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: KSecondColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}