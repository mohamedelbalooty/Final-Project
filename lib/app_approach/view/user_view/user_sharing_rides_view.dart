import 'package:final_project/app_approach/controller/api_services.dart';
import 'package:final_project/app_approach/model/ride.dart';
import 'package:final_project/app_approach/view/user_view/user_ride_view.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/core_errorHandeling/error_handeling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:toast/toast.dart';

class UserSharingRidesView extends StatefulWidget {
  @override
  _UserSharingRidesViewState createState() => _UserSharingRidesViewState();
}

class _UserSharingRidesViewState extends State<UserSharingRidesView> {
  bool _sharedRide = false;

  @override
  Widget build(BuildContext context) {
//    var currentRides = Provider.of<AddRides>(context).rides;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KGradientColor,
        centerTitle: true,
        title: Text(
          'الطرق المشتركة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<Ride>>(
          future: Provider.of<ApiService>(context, listen: false)
              .getAllRides(context),
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
                  return Center(
                    child: Text(
                      'عفوا! لقد حدث خطأ اثناء الاتصال يرجى التاكد من الاتصال بالانترنت.',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  if (snapshot.data != null) {
                    var _dataDetails = snapshot.data;
                    return ListView.builder(
                      itemCount: _dataDetails.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (_sharedRide != true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserRideView(
                                    current: [
                                      _dataDetails[index].current.first,
                                      _dataDetails[index].current.last
                                    ],
                                    destination: [
                                      _dataDetails[index].destination.first,
                                      _dataDetails[index].destination.last
                                    ],
                                    currentAddress:
                                        _dataDetails[index].currentAddress,
                                    destinationAddress:
                                        _dataDetails[index].destinationAddress,
                                    distance: _dataDetails[index].distance,
                                    price: _dataDetails[index].price,
                                    dbId: _dataDetails[index].dbId,
                                    driverId: _dataDetails[index].driverId,
                                    carNumber: _dataDetails[index].carNumber,
                                    phone: _dataDetails[index].phone,
                                    name: _dataDetails[index].name,
                                    email: _dataDetails[index].email,
                                    driverProfileImage:
                                        _dataDetails[index].driverProfileImage,
                                    rating: _dataDetails[index].rating,
                                  ),
                                ),
                              ).then((value) {
                                setState(() {
                                  _sharedRide = value;
                                });
                              });
                            } else {
                              Toast.show(
                                  'عذراً لقد تم حجز رحلة مسبقاً!', context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.CENTER);
                            }
                          },
                          child: Card(
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
                                    padding: EdgeInsets.only(top: 15, right: 5),
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
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
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: Text('error'));
                }
                break;
            }
          }),
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
