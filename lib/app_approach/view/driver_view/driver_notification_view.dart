import 'package:final_project/app_approach/controller/api_services.dart';
import 'package:final_project/app_approach/model/ride.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/core_errorHandeling/error_handeling.dart';
import 'package:final_project/life_tracking/ride_location_tracker.dart';
import 'package:final_project/provider/addRides.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:toast/toast.dart';

class DriverNotificationView extends StatefulWidget {
  static String id = 'DriverNotificationView';
  final String driverId;

  // ignore: sort_constructors_first
  DriverNotificationView({@required this.driverId});

  @override
  _DriverNotificationViewState createState() => _DriverNotificationViewState();
}

class _DriverNotificationViewState extends State<DriverNotificationView> {
  bool _acceptRide = false;

  @override
  Widget build(BuildContext context) {
    var currentRides = Provider.of<AddRides>(context).rides;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KGradientColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'اشعارات الطرق',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<Ride>>(
        future: ApiService().getAllRides(context),
        // ignore: missing_return
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.none:
              return internetConnectionError();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return internetConnectionError();
              } else {
                if (snapshot.data != null) {
                  var _dataDetails = snapshot.data;
                  return ListView.builder(
                    itemCount: _dataDetails.length,
                    itemBuilder: (context, index) {
                      return _dataDetails[index].email ==
                              Provider.of<AuthenticationResult>(context)
                                  .emailing
                          ? Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 15, right: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                                            style: TextStyle(
                                              color: KBlackColor,
                                              height: 0.5,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _rideTimeLine(
                                        index,
                                        _dataDetails[index].currentAddress,
                                        true,
                                        false,
                                        Colors.greenAccent.shade400,
                                        Icons.location_searching),
                                    _rideTimeLine(
                                        index,
                                        _dataDetails[index].destinationAddress,
                                        false,
                                        true,
                                        Colors.red,
                                        Icons.location_on_rounded),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 10, left: 5, top: 10),
                                      child: Row(
                                        children: [
                                          _driverAcceptButton(
                                              'قبول', KGradientColor, () {
                                            if (_acceptRide != true) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RideLocationTracker(
                                                    LatLng(
                                                        _dataDetails[index]
                                                            .current
                                                            .first,
                                                        _dataDetails[index]
                                                            .current
                                                            .last),
                                                    LatLng(
                                                        _dataDetails[index]
                                                            .destination
                                                            .first,
                                                        _dataDetails[index]
                                                            .destination
                                                            .last),
                                                  ),
                                                ),
                                              ).then((value) {
                                                setState(() {
                                                  _acceptRide = value;
                                                });
                                              });
                                            } else {
                                              Toast.show(
                                                  'عذراً لقد تم قبول رحلة مسبقاً!',
                                                  context,
                                                  duration: Toast.LENGTH_LONG,
                                                  gravity: Toast.CENTER);
                                            }
                                          }),
                                          _driverAcceptButton('رفض', Colors.red,
                                              () {
                                            Provider.of<AddRides>(context,
                                                    listen: false)
                                                .rideDelete(
                                                    currentRides[index]);
                                          }),
                                          Expanded(child: SizedBox()),
                                          Text(
                                            '${_dataDetails[index].price / 2} LE',
                                            style: TextStyle(
                                              color: KOrangeColor,
                                              height: 0.5,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container();
                    },
                  );
                }
                return Center(child: Text('error'));
              }
              break;
          }
        },
      ),
    );
  }

  InkWell _driverAcceptButton(String title, Color color, Function onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 30,
        width: 100,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(color: color, offset: Offset(-1, 1), blurRadius: 5),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: KWhiteColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  TimelineTile _rideTimeLine(int index, String address, bool first, bool last,
      Color color, IconData icon) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: first,
      isLast: last,
      indicatorStyle: IndicatorStyle(
        width: 25,
        color: color,
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: icon,
        ),
      ),
      endChild: Container(
        constraints: BoxConstraints(
          minHeight: 50,
          minWidth: 70,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 14, right: 5),
          child: Flexible(
            child: Text(
              address,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: KBlackColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
