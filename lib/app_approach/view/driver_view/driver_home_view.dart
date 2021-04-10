import 'package:flutter/material.dart';

class DriverHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('HomeViewInner'),
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
                height: 20.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/photos/person.jpg'),
                  radius: 30.0,
                ),
                title: Text(
                  "Ahmad",
                  style: TextStyle(fontSize: 20.0),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'PICK UP: 6:25PM',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    )
                  ],
                ),
                trailing: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
