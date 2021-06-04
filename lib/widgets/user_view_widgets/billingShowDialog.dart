import 'package:final_project/app_approach/model/driver_model.dart';
import 'package:final_project/app_approach/view/user_view/user_payment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../constants.dart';
import 'driversBottomSheet.dart';

Future billingShowDialog(
    double height,
    double width,
    BuildContext context,
    var currentLatlng,
    var destinationLatlng,
    String currentAddress,
    String destinationAddress) {
  var _driversDataList = DriversData().drivers;

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 300,
//            height: height * 0.46,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          ExactAssetImage('assets/images/photos/Asset 9.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'من أجل إتمام الحجز ، يرجى إضافة طريقة دفع أو الكشف عن عملية الصرف',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: KBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                Divider(
                  height: 2.5,
                  color: KGradientColor,
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    _customShowDialogButton(KGradientColor, 'الدفع الالكتروني', () {
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
                    SizedBox(
                      width: 10.0,
                    ),
                    _customShowDialogButton(KOrangeColor, 'كاش', () {
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
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
