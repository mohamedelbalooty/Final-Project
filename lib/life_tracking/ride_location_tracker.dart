import 'package:final_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_notifier.dart';

class RideLocationTracker extends StatefulWidget {
  final LatLng current;
  final LatLng destination;

  RideLocationTracker(this.current, this.destination);

  @override
  _RideLocationTrackerState createState() => _RideLocationTrackerState();
}

class _RideLocationTrackerState extends State<RideLocationTracker> {
  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  final mapNotifier = MapNotifier(Marker(
    markerId: MarkerId('3'),
    position: LatLng(31.037933, 31.381523),
  ));

  bool _isLoading = false;

  Future callMe() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    callMe();
    mapNotifier.subscribeToLocation();
    setState(() {
      default1 = widget.current;
      default2 = widget.destination;
    });
    createPolyline();
  }

  List<Polyline> myPolyline = [];
  var default1 = LatLng(30.97063, 31.1669);
  var default2 = LatLng(31.037933, 31.381523);

  void createPolyline() {
    myPolyline.add(
      Polyline(
        polylineId: PolylineId('1'),
        color: Colors.red,
        width: 3,
        points: <LatLng>[default2, default1],
        patterns: [
          PatternItem.dash(20),
          PatternItem.gap(10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تتبع الطريق'),
        backgroundColor: KGradientColor,
        actions: [
          IconButton(
            color: KWhiteColor,
            icon: Icon(
              Icons.arrow_forward,
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
      body: _isLoading != true
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                AnimatedBuilder(
                  animation: mapNotifier,
                  builder: (_, __) => GoogleMap(
                    mapType: _currentMapType,
                    zoomControlsEnabled: true,
                    compassEnabled: true,
                    trafficEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(30.033333, 31.233334),
                      zoom: 13,
                    ),
                    markers: mapNotifier.markers,
                    polylines: myPolyline.toSet(),
                    circles: mapNotifier.circles,
                    onMapCreated: (GoogleMapController controller) {
                      mapNotifier.googleMapController = controller;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 20.0,
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: _onMapTypeButtonPressed,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: KGradientColor,
                          child: const Icon(
                            Icons.map,
                            size: 36.0,
                            color: KOrangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    mapNotifier.dispose();
    super.dispose();
  }
}
