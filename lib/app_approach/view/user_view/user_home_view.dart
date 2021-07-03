import 'dart:collection';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/addRides.dart';
import 'package:final_project/provider/onClick.dart';
import 'package:final_project/widgets/user_view_widgets/alertShowDialog.dart';
import 'package:final_project/widgets/user_view_widgets/destinationDetails.dart';
import 'package:final_project/widgets/user_view_widgets/driversBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHomeView extends StatefulWidget {
  static String id = 'UserHomeView';
  final String uId;

  // ignore: sort_constructors_first
  UserHomeView({@required this.uId});

  @override
  _UserHomeViewState createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  String _currentAddress = '';
  String _destinationAddress = '';
  LatLng _currentLatLng;
  LatLng _destinationLatLng;
  var _currentLatitude,
      _currentLongitude,
      _destinationLatitude,
      _destinationLongitude;
  double distance;
//  bool _isLoading = false;
  final _markers = HashSet<Marker>();
  final LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  final Location _location = Location();

  Future _getAddress(latitude, longitude) async {
    var placeMark =
        await Geolocator().placemarkFromCoordinates(latitude, longitude);
    setState(() {
      _currentAddress =
          '${placeMark[0].name} ${placeMark[0].administrativeArea} ${placeMark[0].locality}';
    });
  }

  double _zoomValue = 18.0;

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
        _currentLatLng = LatLng(l.latitude, l.longitude);
        _currentLatitude = l.latitude;
        _currentLongitude = l.longitude;
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
  void initState() {
    super.initState();
    setUserId();
  }
  setUserId() async{
    SharedPreferences _userPrefs = await SharedPreferences.getInstance();
    _userPrefs.setString('userId', widget.uId);
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: KGradientColor,
        title: Text(
          'توصيلة هوم',
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
            Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        GoogleMap(
                          onTap: (LatLng currentLatLng) async {
                            var placeMark = await Geolocator()
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
                              _destinationLatLng = currentLatLng;
                              _destinationLatitude = currentLatLng.latitude;
                              _destinationLongitude = currentLatLng.longitude;
                              _destinationAddress =
                                  '${placeMark[0].country} ${placeMark[0].administrativeArea} ${placeMark[0].locality}';
                              _zoomValue = 10.0;
                            });
                          },
                          markers: _markers,
                          initialCameraPosition:
                              CameraPosition(target: _initialCameraPosition),
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

  void getDistance() async {
    var distanceInMeters = await Geolocator().distanceBetween(_currentLatitude,
        _currentLongitude, _destinationLatitude, _destinationLongitude);
    setState(() {
      distance = distanceInMeters;
    });
  }

  Container _customMapDetails(double height, double width) {
    return Container(
      height: Provider.of<OnClick>(context, listen: false).click != true ? height * 0.1 : height * 0.19,
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
          destinationDetails(height, width, _currentAddress,
              Icons.location_on_outlined, Colors.green),
          Provider.of<OnClick>(context, listen: false).click == true
              ? destinationDetails(height, width, _destinationAddress,
                  Icons.add_location_alt_outlined, Colors.red)
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
        onTap: () async {
          var onclick = Provider.of<OnClick>(context, listen: false);
          var addRide = Provider.of<AddRides>(context, listen: false);
          if (onclick.click != true &&
              _destinationAddress == '' &&
              addRide.addingRide != true) {
            await alertShowDialog(width, context, 'يرجى تحديد وجهتك');
          } else if (onclick.click != true &&
              _destinationAddress != '' &&
              addRide.addingRide != true) {
            onclick.isChanging(true);
          } else if (onclick.click == true &&
              _destinationAddress != '' &&
              addRide.addingRide != true) {
            await getDistance();
            await driversBottomSheet(
                context,
                height,
                width,
                _currentLatLng,
                _destinationLatLng,
                distance,
                _currentAddress,
                _destinationAddress);
          } else {
            alertShowDialog(width, context, 'الرحلة قائمة الان');
          }
        },
        child: Container(
          height: height * 0.08,
          width: width,
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Provider.of<OnClick>(context, listen: false).click != true ? KGradientColor : KOrangeColor,
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
              Provider.of<OnClick>(context, listen: false).click != true ? 'حدد وجهتك' : 'تأكيد المكان',
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
