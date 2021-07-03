import 'package:flutter/material.dart';

class Driver {
  final String id,
      dbId,
      name,
      email,
      password,
      phone,
      profileImage,
      licenseImage,
      carNumber,
      rating;
  final num price;

  // ignore: sort_constructors_first
  Driver({
    @required this.id,
    @required this.dbId,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.phone,
    @required this.profileImage,
    @required this.licenseImage,
    @required this.carNumber,
    this.rating,
    @required this.price,
  });

  // ignore: sort_constructors_first
  factory Driver.fromJson(Map<String, dynamic> json, databaseId) {
    return Driver(
      id: json['id'],
      dbId: json['dbId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      profileImage: json['profileImage'],
      licenseImage: json['licenseImage'],
      carNumber: json['carNumber'],
      rating: json['rating'],
      price: json['price'],
    );
  }
}
