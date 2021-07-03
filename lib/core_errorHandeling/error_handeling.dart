import 'package:flutter/material.dart';

Container loading(){
  return Container(
    height: 100,
    width: 100,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Container internetConnectionError(){
  return Container(
    height: 100,
    width: 100,
    child: Center(
      child: Text(
        'عفوا! لقد حدث خطأ اثناء الاتصال يرجى التاكد من الاتصال بالانترنت.',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}