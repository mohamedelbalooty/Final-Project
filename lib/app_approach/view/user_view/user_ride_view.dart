import 'package:final_project/constants.dart';
import 'package:final_project/widgets/user_view_widgets/custom_timeLine.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class UserRideView extends StatefulWidget {
  static const String id = 'UserOnTripView';
  final List<dynamic> current;
  final List<dynamic> destination;
  final String currentAddress, destinationAddress;
  final num distance;
  final int price;
  final String driverId,
      dbId,
      name,
      email,
      phone,
      driverProfileImage,
      carNumber,
      rating;

  // ignore: sort_constructors_first
  UserRideView({
    @required this.current,
    @required this.destination,
    @required this.currentAddress,
    @required this.destinationAddress,
    @required this.price,
    @required this.distance,
    @required this.dbId,
    @required this.driverId,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.carNumber,
    @required this.driverProfileImage,
    @required this.rating,
  });

  @override
  _UserRideViewState createState() => _UserRideViewState();
}

class _UserRideViewState extends State<UserRideView> {
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
  List<Polyline> myPolyline = [];

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

  bool _isLoading = false;
  bool _onGoing = false;

  @override
  void initState() {
    super.initState();
    callMe();
    setState(() {
      default1 = LatLng(widget.current.first, widget.current.last);
      default2 = LatLng(widget.destination.first, widget.destination.last);
    });
    createPolyline();
  }

  Future callMe() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
//      appBar: AppBar(automaticallyImplyLeading: true,),
      body: _isLoading == false
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _tripMap(height, width),
                _tripCard(height, width),
//                Container(
//                  height: height * 0.45,
//                  width: width,
//                  color: KWhiteColor,
//                  child: Expanded(
//                    child: Container(
//                      margin: EdgeInsets.all(20.0),
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.black26,
//                              offset: Offset(5, 5),
//                              blurRadius: 3,
//                              spreadRadius: 1.5),
//                          BoxShadow(
//                              color: Colors.black26,
//                              offset: Offset(-1, 0),
//                              blurRadius: 3,
//                              spreadRadius: 1.5),
//                        ],
//                      ),
//                      child: Column(
//                        children: [
//                          _driverInfo(width),
//                          Expanded(
//                            child: customTimeLine(
//                                Colors.greenAccent.shade400,
//                                Icons.location_searching,
//                                widget.currentAddress,
//                                true,
//                                false),
//                          ),
//                          Expanded(
//                            child: customTimeLine(
//                                Colors.red,
//                                Icons.location_on_rounded,
//                                widget.destinationAddress,
//                                false,
//                                true),
//                          ),
//                          Expanded(
//                            child: Padding(
//                              padding:
//                                  const EdgeInsets.symmetric(horizontal: 10),
//                              child: Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Expanded(
//                                    child: Image.asset(
//                                      'assets/images/icons/staticCar.png',
//                                    ),
//                                  ),
//                                  Expanded(
//                                    child: Row(
//                                      mainAxisAlignment: MainAxisAlignment.end,
//                                      children: [
//                                        _tripInfo(
//                                            'المسافة', '${widget.distance} KM'),
//                                        SizedBox(
//                                          width: 15,
//                                        ),
//                                        _tripInfo(
//                                            'السعر', '${widget.price / 2} LE'),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            child: _goToTripButton(height),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
              ],
            ),
    );
  }

  Widget _tripMap(double height, double width) {
    return Stack(
      children: [
        Container(
          height: height * 0.55,
          width: width,
          child: GoogleMap(
            polylines: myPolyline.toSet(),
            markers: {
              Marker(
                markerId: MarkerId('1'),
                position: LatLng(widget.current.first, widget.current.last),
              ),
              Marker(
                markerId: MarkerId('2'),
                position:
                    LatLng(widget.destination.first, widget.destination.last),
              )
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.current.first, widget.current.last)),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigo,
                        offset: Offset(1, 1),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.indigo,
                        offset: Offset(-1, 1),
                        blurRadius: 5),
                  ],
                ),
                child: Center(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(_onGoing),
                    child: Icon(
                      Icons.close,
                      color: KGradientColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: width * 0.7,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo,
                            offset: Offset(1, 1),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.indigo,
                            offset: Offset(-1, 1),
                            blurRadius: 5),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'الرحلة المشتركة الحالية',
                        style: TextStyle(
                          color: KBorderColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _tripCard(double height, double width) {
    return Container(
      height: height * 0.45,
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
              Expanded(
                child: customTimeLine(
                    Colors.greenAccent.shade400,
                    Icons.location_searching,
                    widget.currentAddress,
                    true,
                    false),
              ),
              Expanded(
                child: customTimeLine(Colors.red, Icons.location_on_rounded,
                    widget.destinationAddress, false, true),
              ),
              Expanded(
                child: Padding(
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
                            _tripInfo('المسافة', '${widget.distance} KM'),
                            SizedBox(
                              width: 15,
                            ),
                            _tripInfo('السعر', '${widget.price / 2} LE'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _goToTripButton(height),
              ),
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
        if (_onGoing != true) {
          setState(() {
            _onGoing = true;
          });
          Toast.show('تم الطلب بنجاح انتظر السيارة', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KGradientColor,
        ),
        child: Center(
          child: Text(
            _onGoing != true ? 'اذهب' : 'أنت في الرحلة حالياً',
            style: TextStyle(
              color: KWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
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
              backgroundImage: NetworkImage(widget.driverProfileImage),
              radius: 30,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: KBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.rating,
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
                onTap: () async {
                  await launch(('tel:${widget.phone}'));
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
