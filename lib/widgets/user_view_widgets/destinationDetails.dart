import 'package:flutter/material.dart';

Container destinationDetails(
    double height,
    double width,
    String title,
    String address,
    IconData icon,
    Color color,
    ) {
  return Container(
    height: height * 0.07,
    width: width,
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 2.0,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          Text(
            address,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Expanded(child: SizedBox()),
          Icon(
            icon,
            color: color,
            size: 25,
          ),
        ],
      ),
    ),
  );
}