import 'package:flutter/cupertino.dart';

class DriverModel {
  final String name, image, rating;
  final int id, phoneNumber;
  final double price;

  // ignore: sort_constructors_first
  DriverModel({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.phoneNumber,
    @required this.price,
    @required this.rating,
  });
}

class DriversData{
  List<DriverModel> drivers = [
    DriverModel(
        id: 1,
        name: 'محمد',
        image:
        'https://cdn3.vectorstock.com/i/1000x1000/91/32/young-man-cartoon-vector-17299132.jpg',
        phoneNumber: 01111111234,
        price: 4*25.0,
        rating: '⭐⭐⭐⭐'),
    DriverModel(
        id: 2,
        name: 'جمال',
        image:
        'https://cdn3.vectorstock.com/i/1000x1000/63/42/young-man-face-cartoon-vector-19116342.jpg',
        phoneNumber: 01111112345,
        price: 5*25.0,
        rating: '⭐⭐⭐⭐⭐'),
    DriverModel(
        id: 3,
        name: 'محمود',
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBfaLpucJ-ZxchbI-sbTjRmuZquahlul7Bsraf9tnTPopHNjggT3E_diP02nZgPEYjgEo&usqp=CAU',
        phoneNumber: 01111123456,
        price: 3*25.0,
        rating: '⭐⭐'),
    DriverModel(
        id: 4,
        name: 'مصطفى',
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3UayzfjvoAG07UbS9G26kW4tjmHS1w4o144NoGIAAUXosn4d0jfUpo5yDyVXYR6KwqzM&usqp=CAU',
        phoneNumber: 01111234567,
        price: 2.5*25.0,
        rating: '⭐⭐⭐'),
  ];
}
