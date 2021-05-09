import 'package:flutter/cupertino.dart';

class RideModel {
  String currentAddress, destinationAddress;
  double ridePrice;
  DateTime now = DateTime.now();
  DateTime time =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  // ignore: sort_constructors_first
  RideModel({
    @required this.currentAddress,
    @required this.destinationAddress,
    @required this.ridePrice,
  });
}
//class RidesData{
//  List<RideModel> rides = [
//    RideModel(currentAddress: currentAddress, destinationAddress: destinationAddress, ridePrice: ridePrice, time: time)
//  ];
//}
