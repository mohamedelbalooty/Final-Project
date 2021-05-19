import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

Widget buildOnboardDescription({
  BuildContext context,
  String img,
  String title,
  String description,
}) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset(
              img,
              width: 300,
              height: 300,
            ),
          ),

          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              height: 1.2,
              color: Colors.deepOrangeAccent,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17.0, height: 1.3),
            ),
          ),
        ],
      ),
    ),
  );
}
