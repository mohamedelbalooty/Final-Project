import 'package:final_project/app_approach/model/driver_model.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/widgets/user_view_widgets/custom_timeLine.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UserOnTripView extends StatefulWidget {
  static const String id = 'UserOnTripView';
  final LatLng current;
  final LatLng destination;
  final String currentAddress, destinationAddress;
  final DriverModel currentDriver;

  // ignore: sort_constructors_first
  UserOnTripView({
    @required this.current,
    @required this.destination,
    @required this.currentAddress,
    @required this.destinationAddress,
    @required this.currentDriver,
  });

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
          CameraPosition(
              target: LatLng(l.latitude, l.longitude),
              zoom: 10,
              tilt: 90,
              bearing: 180.0),
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
//  BitmapDescriptor customMarker;
  // ignore: always_declare_return_types
//  createCustomMarker() async {
//    customMarker = await BitmapDescriptor.fromAssetImage(
//        ImageConfiguration.empty, 'assets/images/icons/driving_pin.png', );
//  }

////  List<Marker>
//  var markers = [];
//  createMarkers() {
//    markers.add(
//      Marker(
//        markerId: MarkerId('1'),
////        icon:
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
//    createCustomMarker();
    setState(() {
      default1 = widget.current;
      default2 = widget.destination;
    });
    createPolyline();
  }

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          _tripMap(height, width),
          _tripCard(height, width),
        ],
      ),
    );
  }

  Container _tripMap(double height, double width) {
    return Container(
      height: height * 0.5,
      width: width,
      child: GoogleMap(
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
        initialCameraPosition: CameraPosition(target: _initialcameraposition),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        myLocationEnabled: false,
      ),
    );
  }

  Container _tripCard(double height, double width) {
    return Container(
      height: height * 0.5,
      width: width,
      color: KWhiteColor,
      child: Expanded(
        child: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(5, 5),
                  blurRadius: 3,
                  spreadRadius: 1.5),
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-1, 0),
                  blurRadius: 3,
                  spreadRadius: 1.5),
            ],
          ),
          child: Column(
            children: [
              _driverInfo(width),
              customTimeLine(Colors.greenAccent.shade400,
                  Icons.location_searching, widget.currentAddress, true, false),
              customTimeLine(Colors.red, Icons.location_on_rounded,
                  widget.destinationAddress, false, true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/icons/staticCar.png',
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _tripInfo('Distance', '5 KM'),
                          SizedBox(
                            width: 15,
                          ),
                          _tripInfo('Price', '15 LE'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              _goToTripButton(height),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _tripInfo(String title, String titleValue) {
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: KGrayColor, height: 1),
          ),
          Text(
            titleValue,
            style: TextStyle(
                fontSize: 17,
                color: KBlackColor,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ],
      ),
    );
  }

  InkWell _goToTripButton(double height) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: height * 0.42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            ExactAssetImage('assets/images/icons/car.gif'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        'Share ride ?!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          _customShowDialogButton(KOrangeColor, 'Yes', () {
//                            Navigator.of(context).pop();
//                            driversBottomSheet(
//                                context,
//                                height,
//                                _driversDataList,
//                                width,
//                                currentLatlng,
//                                destinationLatlng,
//                                currentAddress,
//                                destinationAddress);
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          _customShowDialogButton(KGradientColor, 'No', () {
//                            Navigator.of(context).pop();
//                            showDialog(
//                              context: context,
//                              builder: (context) {
//                                return AlertDialog(
//                                  content: UserPaymentView(),
//                                );
//                              },
//                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });

      },
      child: Flexible(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: KGradientColor,
          ),
          child: Center(
            child: Text(
              'Go',
              style: TextStyle(
                color: KWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _customShowDialogButton(
      Color color, String buttonTitle, Function onClick) {
    return Expanded(
      child: RaisedButton(
        color: color,
        onPressed: onClick,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container _driverInfo(double width) {
    return Container(
      height: 70,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.currentDriver.image),
              radius: 30,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.currentDriver.name,
                  style: TextStyle(
                    color: KBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.currentDriver.rating,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(3, 3),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  //TODO URL LANCHER
                },
                child: Icon(
                  Icons.phone,
                  color: KWhiteColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//                    Expanded(
//                      child: TimelineNode(
//                        indicator: Icon(
//                          Icons.location_searching,
//                          color: Colors.greenAccent.shade400,
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                      child: SizedBox(
//                        height: 100.0,
//                        child: DashedLineConnector(color: Colors.grey,),
//                      ),
//                    ),
//                    Expanded(
//                      child: TimelineNode(
//                        indicator: Icon(
//                          Icons.location_on_rounded,
//                          color: Colors.red,
//                        ),
//                      ),
//                    ),
