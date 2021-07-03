import 'dart:io';
import 'package:final_project/app_approach/model/driver.dart';
import 'package:final_project/app_approach/model/passenger.dart';
import 'package:final_project/app_approach/model/ride.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toast/toast.dart';

class ApiService extends ChangeNotifier {
  String baseUrl = 'https://flutter-project-f9a07-default-rtdb.firebaseio.com/';

  Future addNewPassenger(Passenger newPassenger) async {
    await http.post('$baseUrl/passengers.json',
        body: jsonEncode({
          'id': newPassenger.id,
          'name': newPassenger.name,
          'email': newPassenger.email,
          'password': newPassenger.password,
          'phone': newPassenger.phone,
          'image': newPassenger.image
        }));
  }

  Future addNewDriver(Driver newDriver) async {
    await http.post('$baseUrl/drivers.json',
        body: jsonEncode({
          'id': newDriver.id,
          'name': newDriver.name,
          'email': newDriver.email,
          'password': newDriver.password,
          'phone': newDriver.phone,
          'profileImage': newDriver.profileImage,
          'licenseImage': newDriver.licenseImage,
          'rating': '⭐⭐⭐',
          'price': newDriver.price,
        }));
  }

  Future<List<Driver>> getAllDrivers(BuildContext context) async {
    List<Driver> drivers = [];
    try {
      var _response = await http.get('$baseUrl/drivers.json');
      if (_response.statusCode == 200) {
        Map<String, dynamic> _jsonData = jsonDecode(_response.body);
        _jsonData.forEach((key, value) {
          drivers.add(Driver.fromJson(value, key));
        });
      }
      return drivers;
    } on SocketException {
      Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } catch (exception) {
      Toast.show('عفو! لقد حدث خطأ', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  Future addNewRide(Ride newRide) async {
    await http.post('$baseUrl/rides.json',
        body: jsonEncode({
          'rideId': newRide.rideId,
          'currentAddress': newRide.currentAddress,
          'destinationAddress': newRide.destinationAddress,
          'current': newRide.current,
          'destination': newRide.destination,
          'price': newRide.price,
          'distance': newRide.distance,
          'dbId': newRide.dbId,
          'driverId': newRide.driverId,
          'name': newRide.name,
          'email': newRide.email,
          'phone': newRide.phone,
          'driverProfileImage': newRide.driverProfileImage,
          'rating': newRide.rating,
        }));
  }


  Future<List<Ride>> getAllRides(BuildContext context) async {
    List<Ride> rides = [];
    try {
      var _response = await http.get('https://flutter-project-f9a07-default-rtdb.firebaseio.com/rides.json');
      if (_response.statusCode == 200) {
        Map<String, dynamic> _jsonData = jsonDecode(_response.body);
        _jsonData.forEach((key, value) {
          rides.add(Ride.fromJson(value, key));
        });
      }
      return rides;
    }
    on SocketException {
      Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
    catch (exception) {
      Toast.show('عفو! لقد حدث خطأ', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }


  Future<List<Passenger>> getAllPassengers(BuildContext context) async {
    List<Passenger> passengers = [];
    try {
      var _response = await http.get('$baseUrl/passengers.json');
      if (_response.statusCode == 200) {
        Map<String, dynamic> _jsonData = jsonDecode(_response.body);
        _jsonData.forEach((key, value) {
          passengers.add(Passenger.fromJson(value, key));
        });
      }
      return passengers;
    } on SocketException {
      Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } catch (exception) {
      Toast.show('عفو! لقد حدث خطأ', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}
