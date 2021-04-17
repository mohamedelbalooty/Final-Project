import 'package:flutter/material.dart';

class DriverHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('HomeViewInner'),
        ),
      ),
    );
  }
}
