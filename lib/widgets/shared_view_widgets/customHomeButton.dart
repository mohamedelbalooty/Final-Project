import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

Widget buildHomeButton(
    {BuildContext context,
      String title,
      List<Color> buttonColor,
      // Color borderColor,
    Widget nextScreen}) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen,));
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: KWhiteColor, fontSize: 18,),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: buttonColor,
            ),
            borderRadius: BorderRadius.circular(8),
            ),
      ),
    ),
  );
}