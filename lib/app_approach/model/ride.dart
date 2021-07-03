import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'driver.dart';

class Ride {
  final String rideId, currentAddress, destinationAddress;
  final List<dynamic> current, destination;
  final num distance;
  final int price;
  final String driverId,
      dbId,
      name,
      email,
      phone,
      driverProfileImage,
      carNumber,
      rating;

  // ignore: sort_constructors_first
  Ride({
    @required this.rideId,
    @required this.currentAddress,
    @required this.destinationAddress,
    @required this.current,
    @required this.destination,
    @required this.price,
    @required this.distance,
    @required this.dbId,
    @required this.driverId,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.carNumber,
    @required this.driverProfileImage,
    @required this.rating,
  });

  // ignore: sort_constructors_first
  factory Ride.fromJson(Map<String, dynamic> json, databaseId) {
    return Ride(
      rideId: json['rideId'],
      currentAddress: json['currentAddress'],
      destinationAddress: json['destinationAddress'],
      current: json['current'],
      destination: json['destination'],
      price: json['price'],
      distance: json['distance'],
      dbId: json['dbId'],
      driverId: json['driverId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      carNumber: json['carNumber'],
      driverProfileImage: json['driverProfileImage'],
      rating: json['rating'],
    );
  }
}
