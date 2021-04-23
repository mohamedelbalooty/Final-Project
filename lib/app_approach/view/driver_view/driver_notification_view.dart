import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';

class DriverNotificationView extends StatefulWidget {
  static String id = 'DriverNotificationView';

  @override
  _DriverNotificationViewState createState() => _DriverNotificationViewState();
}

class _DriverNotificationViewState extends State<DriverNotificationView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 5),
              child: TabBar(
                isScrollable: false,
                indicatorColor: KOrangeColor,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                tabs: [
                  _customTap(currentIndex, 0, 'Pending'),
                  _customTap(currentIndex, 1, 'Rejected'),
                  _customTap(currentIndex, 2, 'Accepted'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Customer(
                      imageUrl: "assets/images/photos/person.jpg",
                      name: "Smith Mark",
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _customTap(currentIndex, index, title) {
  return Tab(
    child: Container(
      height: 55,
      width: 100,
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: KGradientColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 19.0,
              color: currentIndex == index ? KOrangeColor : KWhiteColor),
        ),
      ),
    ),
  );
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
