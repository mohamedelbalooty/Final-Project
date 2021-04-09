import 'package:flutter/material.dart';

class DriverProfileView extends StatelessWidget {
  static String id = 'DriverProfileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1514316454349-750a7fd3da3a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80 "),
                      fit: BoxFit.cover)),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1616257892423-861f4e77bd48?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1868&q=80 "),
                    radius: 60.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Lukas",
              style: TextStyle(
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 70,
            ),
            DriverInfo(
              icon: Icons.email,
              info: 'driver@gmail.com',
            ),
            SizedBox(height: 20.0),
            DriverInfo(
              icon: Icons.phone,
              info: '+20101625628',
            ),
            SizedBox(height: 20.0),
            DriverInfo(
              icon: Icons.car_rental,
              info: '8596',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.home,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class DriverInfo extends StatelessWidget {
  final String info;
  final IconData icon;
  DriverInfo({this.icon, this.info});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 25.0,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          info,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
