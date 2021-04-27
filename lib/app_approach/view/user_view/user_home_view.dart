import 'dart:collection';
import 'package:final_project/constants.dart';
import 'package:final_project/widgets/user_view_widgets/billingShowDialog.dart';
import 'package:final_project/widgets/user_view_widgets/destinationDetails.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:toast/toast.dart';

class UserHomeView extends StatefulWidget {
  static String id = 'UserHomeView';

  @override
  _UserHomeViewState createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  String _currentAddress = '';
  String _destinationAddress = '';
  double _latitude, _longitude;
  bool _isLoading = false;
  bool _onClick = false;
  var _markers = HashSet<Marker>();
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();

  Future _getAddress(latitude, longitude) async {
    List<Placemark> placeMark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    setState(() {
      _currentAddress =
          '${placeMark[0].name} ${placeMark[0].administrativeArea} ${placeMark[0].locality}';
    });
  }

  void _onMapCreated(GoogleMapController _control) async {
    _controller = _control;
    _location.onLocationChanged.listen((l) async {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 18),
        ),
      );
      setState(() {
        _latitude = l.latitude;
        _longitude = l.longitude;
      });
      _getAddress(l.latitude, l.longitude);
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

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KGradientColor,
        title: Text(
          'Tawsela Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            _isLoading == false
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        GoogleMap(
                          onTap: (LatLng currentLatLng) {
                            setState(() {
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('id'),
                                  position: LatLng(currentLatLng.latitude,
                                      currentLatLng.longitude),
                                ),
                              );
                            });
                          },
                          onLongPress: (LatLng currentLatLng) async {
                            List<Placemark> placeMark = await Geolocator()
                                .placemarkFromCoordinates(
                                    currentLatLng.latitude,
                                    currentLatLng.longitude);
                            setState(() {
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('id1'),
                                  position: LatLng(currentLatLng.latitude,
                                      currentLatLng.longitude),
                                ),
                              );
                              _destinationAddress =
                                  '${placeMark[0].country} ${placeMark[0].administrativeArea} ${placeMark[0].locality}';
                            });
                          },
                          markers: _markers,
                          initialCameraPosition:
                              CameraPosition(target: _initialcameraposition),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          buildingsEnabled: true,
                          mapToolbarEnabled: false,
                          zoomControlsEnabled: false,
                          myLocationEnabled: true,
                        ),
                      ],
                    ),
                  ),
            _customMapDetails(height, width),
            _confirmationButton(height, width),
          ],
        ),
      ),
    );
  }

  Container _customMapDetails(double height, double width) {
    return Container(
      height: _onClick != true ? height * 0.1 : height * 0.19,
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
          destinationDetails(height, width, 'From ', _currentAddress,
              Icons.add_location_outlined, Colors.red),
          _onClick
              ? destinationDetails(height, width, 'To ', _destinationAddress,
                  Icons.add_location_alt_outlined, Colors.green)
              : Container(),
        ],
      ),
    );
  }

  Positioned _confirmationButton(double height, double width) {
    return Positioned(
      bottom: 0,
      right: 20,
      left: 20,
      child: InkWell(
        onTap: () {
          if (_onClick != true && _destinationAddress == '') {
            Toast.show('Please Enter your destination', context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM,);
          } else if (_onClick != true && _destinationAddress != '') {
            setState(() {
              _onClick = true;
            });
          } else if (_onClick == true && _destinationAddress != '') {
            billingShowDialog(height, context);
          }
        },
        child: Container(
          height: height * 0.08,
          width: width,
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: _onClick != true ? KGradientColor : KOrangeColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              _onClick != true ? 'Set Destination' : 'Confirm Destination',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
