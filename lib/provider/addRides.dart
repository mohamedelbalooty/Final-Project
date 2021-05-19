import 'package:final_project/app_approach/model/driver_model.dart';
import 'package:final_project/app_approach/model/ride_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class AddRides extends ChangeNotifier {
  List<RideModel> rides = [
    RideModel(
      currentAddress: 'المنصورة شارع الجلاء',
      destinationAddress: 'طنطا شارع البحر',
      rideCurrent: LatLng(31.037933, 31.381523),
      rideDestination: LatLng(30.7911111, 30.9980556),
      currentDriver: DriverModel(
        image:
            'https://img.freepik.com/free-vector/man-face-avatar-cartoon-character_18591-55466.jpg?size=338&ext=jpg',
        name: 'محمد',
        id: 5,
        phoneNumber: 0122455788,
        price: 30,
        rating: '⭐⭐⭐⭐',
      ),
    ),
    RideModel(
      currentAddress: 'المحلة قسم اول',
      destinationAddress: 'طنطا شارع البحر',
      rideCurrent: LatLng(30.97063, 31.1669),
      rideDestination: LatLng(31.037933, 31.381523),
      currentDriver: DriverModel(
        image:
            'https://st2.depositphotos.com/1007566/12187/v/950/depositphotos_121873706-stock-illustration-face-man-cartoon-moustache-isolated.jpg',
        name: 'احمد',
        id: 5,
        phoneNumber: 0122455788,
        price: 50,
        rating: '⭐⭐',
      ),
    ),
  ];

  void rideAdding(RideModel currentRide) {
    rides.add(currentRide);
    notifyListeners();
  }

  void rideDelete(RideModel currentRide) {
    rides.remove(currentRide);
    notifyListeners();
  }

  bool addingRide = false;

  void addingRideChanged() {
    addingRide = true;
    notifyListeners();
  }
}
