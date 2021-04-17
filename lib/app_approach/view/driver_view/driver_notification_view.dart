import 'package:flutter/material.dart';

class DriverNotificationView extends StatelessWidget {
  static String id = 'DriverNotificationView';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('DriverNotificationView'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Pending", style: TextStyle(fontSize: 19.0)),
              ),
              Tab(
                child: Text("Accepted", style: TextStyle(fontSize: 19.0)),
              ),
              Tab(child: Text("Rejected", style: TextStyle(fontSize: 19.0))),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Customer(
                imageUrl: "assets/images/photos/person.jpg",
                name: "Smith Mark",
              ),
              SizedBox(height: 10.0),
              Customer(
                imageUrl: "assets/images/photos/person1.jpg",
                name: "Ryan Jones",
              ),
              SizedBox(height: 10.0),
              Customer(
                imageUrl: "assets/images/photos/person2.jpg",
                name: "Locus Nicukas",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Customer extends StatelessWidget {
  final String imageUrl, name;
  Customer({this.imageUrl, this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp),
                      SizedBox(width: 10.0),
                      Text("PICK UP: 6:25PM")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(children: [
          SizedBox(width: 7.0),
          Icon(
            Icons.location_on,
            color: Colors.red,
          ),
          SizedBox(width: 7.0),
          Text("pick up point: Smith railway")
        ]),
        Divider(color: Colors.grey),
        Row(children: [
          SizedBox(width: 7.0),
          Icon(
            Icons.location_on,
            color: Colors.red,
          ),
          SizedBox(width: 7.0),
          Text("pick up point: Smith railway")
        ]),
        SizedBox(height: 15.0),
        Divider(color: Colors.grey),
      ],
    );
  }
}
