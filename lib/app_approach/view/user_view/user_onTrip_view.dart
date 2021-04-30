import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UserOnTripView extends StatefulWidget {
  final LatLng current;
  final LatLng destination;

  // ignore: sort_constructors_first
  UserOnTripView({
    @required this.current,
    @required this.destination,
  });

  static const String id = 'UserOnTripView';

  @override
  _UserOnTripViewState createState() => _UserOnTripViewState();
}

class _UserOnTripViewState extends State<UserOnTripView> {
  final LatLng _initialcameraposition = LatLng(30.97063, 31.1669);
  GoogleMapController _controller;
  final Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 10),
        ),
      );
    });
  }

  var default1 = LatLng(30.97063, 31.1669);
  var default2 = LatLng(31.037933, 31.381523);

//  List<LatLng> _markerLocations = [
//    default1,
//    default2,
//  ];
//  var markers = [
//    Marker(
//      markerId: MarkerId('1'),
//      position: widget.current,
//    ),
//    Marker(
//      markerId: MarkerId('2'),
//      position: LatLng(31.037933, 31.381523),
////      icon: customMarker,
//    ),
//  ];
  BitmapDescriptor customMarker;

  createCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/driving_pin.png');
  }

//  createMarkers() {
//    markers.add(
//      Marker(
//        markerId: MarkerId('1'),
//      ),
//    );
//  }

  List<Polyline> myPolyline = [];

  createPolyline() {
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
  void initState() {
    super.initState();
    setState(() {
      default1 = widget.current;
      default2 = widget.destination;
    });
//    createCustomMarker();
    createPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              polylines: myPolyline.toSet(),
              markers: {
                Marker(
                  markerId: MarkerId('1'),
                  position: widget.current,
                ),
                Marker(
                  markerId: MarkerId('2'),
                  position: widget.destination,
                )
              },
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
