import 'package:flutter/cupertino.dart';

class Passenger {
  final String id, dbId, name, email, password, phone, image;

  // ignore: sort_constructors_first
  Passenger({
    @required this.id,
  @required this.dbId,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.phone,
    @required this.image,
  });

  // ignore: sort_constructors_first
  factory Passenger.fromJson(Map<String, dynamic> json, dbId) {
    return Passenger(
      id: json['id'],
      dbId: json['dbId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['password'] = password;
    data['image'] = image;
    return data;
  }
}
