import 'package:flutter/material.dart';
import '../../constants.dart';

Future alertShowDialog(double width, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 225,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_outlined,
                  color: Colors.redAccent,
                  size: 100,
                ),
                Text(
                  'Warning !!!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                Text(
                  'Please detect your destination',
                  style: TextStyle(
                    fontSize: 18,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                SizedBox(
                  width: width,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: KGradientColor,
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}