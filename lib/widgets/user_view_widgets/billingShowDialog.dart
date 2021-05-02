import 'package:final_project/app_approach/model/driver_model.dart';
import 'package:final_project/app_approach/view/user_view/user_payment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../constants.dart';
import 'driversBottomSheet.dart';

Future billingShowDialog(
    double height,
    double width,
    BuildContext context,
    LatLng currentLatlng,
    LatLng destinationLatlng,
    String currentAddress,
    String destinationAddress) {
  var _driversDataList = DriversData().drivers;

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          ExactAssetImage('assets/images/photos/Asset 9.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'In Order to complete your booking please add a payment method or detect cashing process',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
                Divider(
                  height: 2.5,
                  color: KGradientColor,
                ),
                Row(
                  children: [
                    _customShowDialogButton(KOrangeColor, 'Cash', () {
                      Navigator.of(context).pop();
                      driversBottomSheet(
                          context,
                          height,
                          _driversDataList,
                          width,
                          currentLatlng,
                          destinationLatlng,
                          currentAddress,
                          destinationAddress);
                    }),
                    SizedBox(
                      width: 10.0,
                    ),
                    _customShowDialogButton(KGradientColor, 'Add billing', () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: UserPaymentView(),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      });
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
