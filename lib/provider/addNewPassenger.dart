import 'package:final_project/app_approach/model/passenger.dart';
import 'package:flutter/cupertino.dart';

class AddNewPassenger extends ChangeNotifier{
  Passenger currentPassenger;
  void addCurrentPassenger(Passenger newPassenger){
    currentPassenger = newPassenger;
    notifyListeners();
  }
}