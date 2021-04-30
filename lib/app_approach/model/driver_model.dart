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
        name: 'Mohamed',
        image:
        'https://lesjours.fr/ressources/res480/square/people/pierre-person.jpeg',
        phoneNumber: 01111111234,
        price: 4,
        rating: '⭐⭐⭐⭐'),
    DriverModel(
        id: 2,
        name: 'Gamal',
        image:
        'https://content.fortune.com/wp-content/uploads/2018/07/gettyimages-961697338.jpg?resize=750,500',
        phoneNumber: 01111112345,
        price: 5,
        rating: '⭐⭐⭐⭐⭐'),
    DriverModel(
        id: 3,
        name: 'Mahmoud',
        image:
        'https://inglam.ru/img/2020/06/terry-crews-2018-sundance-film-festival-portraits-002-152x200.jpg',
        phoneNumber: 01111123456,
        price: 3,
        rating: '⭐⭐'),
    DriverModel(
        id: 4,
        name: 'Elbalooty',
        image:
        'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
        phoneNumber: 01111234567,
        price: 2.5,
        rating: '⭐⭐⭐'),
    DriverModel(
        id: 4,
        name: 'Elbalooty',
        image:
        'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
        phoneNumber: 01111234567,
        price: 2.5,
        rating: '⭐⭐⭐'),
    DriverModel(
        id: 4,
        name: 'Elbalooty',
        image:
        'https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg',
        phoneNumber: 01111234567,
        price: 2.5,
        rating: '⭐⭐⭐'),
  ];
}
