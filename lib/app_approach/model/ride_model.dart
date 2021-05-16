import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'driver_model.dart';

class RideModel {
  LatLng rideCurrent, rideDestination;
  DriverModel currentDriver;
  String currentAddress, destinationAddress;
  DateTime now = DateTime.now();
  DateTime time =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  // ignore: sort_constructors_first
  RideModel({
    @required this.rideCurrent,
    @required this.rideDestination,
    @required this.currentAddress,
    @required this.destinationAddress,
    @required this.currentDriver,
//    this.time  = DateTime(),
  });
}
//class RidesData{
//  List<RideModel> rides = [
//    RideModel(currentAddress: currentAddress, destinationAddress: destinationAddress, ridePrice: ridePrice, time: time)
//  ];
//}
