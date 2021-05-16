import 'package:final_project/app_approach/view/user_view/user_ride_view.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/addRides.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:toast/toast.dart';

class UserSharingRidesView extends StatefulWidget {
  @override
  _UserSharingRidesViewState createState() => _UserSharingRidesViewState();
}

class _UserSharingRidesViewState extends State<UserSharingRidesView> {
  bool _isLoading = false;
  bool _sharedRide = false;
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
  }

  @override
  Widget build(BuildContext context) {
    var currentRides = Provider.of<AddRides>(context).rides;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KGradientColor,
        centerTitle: true,
        title: Text(
          'الطرق المشتركة',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: _isLoading == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: currentRides.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if(_sharedRide != true){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserRideView(
                            current: currentRides[index].rideCurrent,
                            destination: currentRides[index].rideDestination,
                            currentAddress: currentRides[index].currentAddress,
                            destinationAddress: currentRides[index].destinationAddress,
                            currentDriver: currentRides[index].currentDriver,
                          ),
                        ),
                      ).then((value) {
                        setState(() {
                          _sharedRide = value;
                        });
                      });
                    }else{
                      Toast.show('عذراً لقد تم حجز رحلة مسبقاً!', context,
                          duration: Toast.LENGTH_LONG,
                          gravity: Toast.CENTER);
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${currentRides[index].time.year}-${currentRides[index].time.month}-${currentRides[index].time.day}',
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
                              currentRides[index].currentAddress,
                              true,
                              false,
                              Colors.greenAccent.shade400,
                              Icons.location_searching),
                          _rideTimeLine(
                              index,
                              currentRides[index].destinationAddress,
                              false,
                              true,
                              Colors.red,
                              Icons.location_on_rounded),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: 10, left: 5, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${currentRides[index].currentDriver.price / 2} LE',
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
