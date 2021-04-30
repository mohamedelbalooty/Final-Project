import 'package:flutter/cupertino.dart';

class RideModel {
  String currentAddress, destinationAddress, ridePrice;
  DateTime time;

  // ignore: sort_constructors_first
  RideModel({
    @required this.currentAddress,
    @required this.destinationAddress,
    @required this.ridePrice,
    @required this.time,
  });
}
//class RidesData{
//  List<RideModel> rides = [
//    RideModel(currentAddress: currentAddress, destinationAddress: destinationAddress, ridePrice: ridePrice, time: time)
//  ];
//}