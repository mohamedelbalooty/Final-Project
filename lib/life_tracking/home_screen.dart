import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_notifier.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mapNotifier = MapNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Live tracking demo"),
      ),
      body: AnimatedBuilder(
        animation: mapNotifier,
        builder: (_, __) => GoogleMap(
          zoomControlsEnabled: false,
          compassEnabled: true,
          trafficEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(31.037933, 31.381523),
            zoom: 16,
          ),
          markers: mapNotifier.markers,
          circles: mapNotifier.circles,
          onMapCreated: (GoogleMapController controller) {
            mapNotifier.googleMapController = controller;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () => mapNotifier.subscribeToLocation(),
      ),
    );
  }

  @override
  void dispose() {
    mapNotifier.dispose();
    super.dispose();
  }
}
