import 'package:final_project/app_approach/model/ride_model.dart';
import 'package:flutter/cupertino.dart';

class AddRides extends ChangeNotifier{
  List<RideModel> rides = [
    RideModel(
      currentAddress: 'المنصورة شارع الجلاء',
      destinationAddress: 'طنطا شارع البحر',
      ridePrice: 50,
    ),
    RideModel(
      currentAddress: 'المحلة قسم اول',
      destinationAddress: 'طنطا شارع البحر',
      ridePrice: 30,
    ),
  ];
  void rideAdding(RideModel currentRide){
    rides.add(currentRide);
    notifyListeners();
  }
  bool addingRide = false;
  void addingRideChanged(){
    addingRide = true;
    notifyListeners();
  }
}