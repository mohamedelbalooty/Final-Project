import 'package:final_project/constants.dart';
import 'package:final_project/provider/addRides.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class UserSharingRides extends StatefulWidget {
  @override
  _UserSharingRidesState createState() => _UserSharingRidesState();
}

class _UserSharingRidesState extends State<UserSharingRides> {
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
                return Card(
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
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          isFirst: true,
                          isLast: false,
                          indicatorStyle: IndicatorStyle(
                            width: 25,
                            color: Colors.greenAccent.shade400,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.location_searching,
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
                                  currentRides[index].currentAddress,
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
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.start,
                          isFirst: false,
                          isLast: true,
                          indicatorStyle: IndicatorStyle(
                            width: 25,
                            color: Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.location_on_rounded,
                            ),
                          ),
                          endChild: Container(
                            constraints:
                                BoxConstraints(minHeight: 50, minWidth: 70),
                            child: Padding(
                              padding: EdgeInsets.only(top: 15, right: 5),
                              child: Flexible(
                                child: Text(
                                  currentRides[index].destinationAddress,
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
                        ),
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
                                '${currentRides[index].ridePrice} LE',
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
                );
              },
            ),
    );
  }
}
