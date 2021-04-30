import 'package:final_project/app_approach/model/driver_model.dart';
import 'package:final_project/app_approach/view/user_view/user_onTrip_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants.dart';

Future driversBottomSheet(BuildContext context, double height,
    List<DriverModel> _driversDataList, double width, LatLng currentLatlng, LatLng destinationLatlng) {
  return showMaterialModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: KGradientColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    context: context,
    builder: (context) => SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 28,
            width: 28,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Colors.blueGrey.shade700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.4,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: _driversDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(context, width, _driversDataList, index, currentLatlng, destinationLatlng);
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

InkWell _listItem(context, double width, List<DriverModel> _driversDataList,
    int index, LatLng currentLatlng, LatLng destinationLatlng) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserOnTripView(
            current: currentLatlng,
            destination: destinationLatlng,
          ),
        ),
      );
    },
    child: Container(
      height: 70,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
                backgroundImage: NetworkImage(_driversDataList[index].image),
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
              '${_driversDataList[index].price}LE',
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
