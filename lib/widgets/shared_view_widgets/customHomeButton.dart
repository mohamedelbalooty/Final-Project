import 'package:flutter/material.dart';

Widget buildHomeButton(
    {BuildContext context,
      String title,
      Color titleColor,
      Color buttonColor,
      Color borderColor,
    Widget nextScreen}) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen,));
    },
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.41,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: titleColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor)),
    ),
  );
}