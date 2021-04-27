import 'package:final_project/app_approach/view/user_view/user_payment_view.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

Future billingShowDialog(double height, BuildContext context) {
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
//                            borderRadius: BorderRadius.circular(15),
//                            border: Border.all(color: KGradientColor),
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
                    }),
                    SizedBox(
                      width: 10.0,
                    ),
                    _customShowDialogButton(
                        KGradientColor, 'Add billing', () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, UserPaymentView.id);
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
