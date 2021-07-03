import 'package:final_project/app_approach/controller/api_services.dart';
import 'package:final_project/app_approach/model/driver.dart';
import 'package:final_project/app_approach/view/user_view/user_onTrip_view.dart';
import 'package:final_project/core_errorHandeling/error_handeling.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

Future driversBottomSheet(
    BuildContext context,
    double height,
    double width,
    LatLng currentLatlng,
    LatLng destinationLatlng,
    double distance,
    String currentAddress,
    String destinationAddress) {
  return showMaterialModalBottomSheet(
    useRootNavigator: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) => FutureBuilder<List<Driver>>(
      future: Provider.of<ApiService>(context, listen: false)
          .getAllDrivers(context),
      // ignore: missing_return
      builder: (_, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.4,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              itemCount: _dataDetails.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _listItem(
                                    context,
                                    width,
                                    _dataDetails,
                                    index,
                                    currentLatlng,
                                    destinationLatlng,
                                    distance,
                                    currentAddress,
                                    destinationAddress);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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

int _calculateTripPrice(price, distance) {
  double distanceInKM = distance / 1000;
  double totalPrice = distanceInKM * price;
  return totalPrice.floor();
}

InkWell _listItem(
    context,
    double width,
    List<Driver> _driversDataList,
    int index,
    LatLng currentLatlng,
    LatLng destinationLatlng,
    double distance,
    String currentAddress,
    String destinationAddress) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserOnTripView(
            current: currentLatlng,
            destination: destinationLatlng,
            currentAddress: currentAddress,
            destinationAddress: destinationAddress,
            currentDriver: _driversDataList[index],
            distance: (distance / 1000).floor(),
            price: _calculateTripPrice(_driversDataList[index].price, distance),
          ),
        ),
      );
    },
    child: Container(
      height: 70,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(3, 3),
            blurRadius: 2,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 10,
                top: 5,
                bottom: 5,
              ),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(_driversDataList[index].profileImage),
                radius: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _driversDataList[index].name,
                  style: TextStyle(
                    color: KBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  _driversDataList[index].rating,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Text(
              '${_calculateTripPrice(_driversDataList[index].price, distance)}LE',
              style: TextStyle(
                color: KBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
