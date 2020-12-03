import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customAuthenticationQuestion(
    BuildContext context, String question, String title, String screen) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0, bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, screen);
          },
          child: Text(
            title,
            style: TextStyle(
              color: KWhiteColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
