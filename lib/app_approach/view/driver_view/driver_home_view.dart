import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../constants.dart';
import 'package:final_project/widgets/user_view_widgets/destinationDetails.dart';

class DriverHomeView extends StatefulWidget {
  @override
  _DriverHomeViewState createState() => _DriverHomeViewState();
}

class _DriverHomeViewState extends State<DriverHomeView> {

  String _currentAddress = '';
  LatLng currentLatLng;
  double _zoomValue = 18.0;
  GoogleMapController _controller;
  final _markers = HashSet<Marker>();
  final LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
  final Location _location = Location();


  bool _isLoading = false;
  Future callMe() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    callMe();
  }

  Future _getAddress(latitude, longitude) async {
    var placeMark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    setState(() {
      _currentAddress =
          '${placeMark[0].name} ${placeMark[0].administrativeArea} ${placeMark[0].locality}';
    });
  }

  void _onMapCreated(GoogleMapController _control) async {
    _controller = _control;
    _location.onLocationChanged.listen((l) async {
      await _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude, l.longitude), zoom: _zoomValue),
        ),
      );
      setState(() {
        currentLatLng = LatLng(l.latitude, l.longitude);
      });
      await _getAddress(l.latitude, l.longitude);
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('id'),
            position: LatLng(l.latitude, l.longitude),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KGradientColor,
        title: Text(
          'الرئيسية للسائق',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: _isLoading == false
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                GoogleMap(
                  markers: _markers,
                  initialCameraPosition:
                      CameraPosition(target: _initialCameraPosition),
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  buildingsEnabled: true,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: true,
                  myLocationEnabled: true,
                ),
                _customMapDetails(height, width),
              ],
            ),
    );
  }
  Container _customMapDetails(double height, double width) {
    return Container(
      height: height * 0.1,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: KGradientColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          destinationDetails(height, width, 'من ', _currentAddress,
              Icons.location_on_outlined, Colors.green),
        ],
      ),
    );
  }
}
