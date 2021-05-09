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
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 25,
          ),
          SizedBox(width: 5),
          Text(
            address,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}