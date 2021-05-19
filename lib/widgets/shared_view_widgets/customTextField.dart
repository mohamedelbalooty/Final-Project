import 'package:final_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String label;
  IconData icon;
  Function onClick;

  CustomTextField(
      {@required this.label, @required this.icon, @required this.onClick});

  _errorMessage(String value) {
    switch (label) {
      case 'الاسم':
        return 'يرجى ادخال الاسم';
        break;
      case 'البريد الالكتروني':
        return 'يرجى ادخال البريد الالكتروني';
        break;
      case 'رقم الهاتف':
        return 'يرجى ادخال رقم الهاتف';
        break;
      case 'كلمة المرور':
        return 'يرجى ادخال كلمة المرور';
        break;
      default:
        return 'Enter your value';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: TextFormField(

        onSaved: onClick,
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return _errorMessage(label);
          }
        },

        cursorColor: KOrangeColor,
        style: TextStyle(
          color: KWhiteColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        obscureText: label == 'كلمة المرور' ? true : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          labelText: label,
          labelStyle: TextStyle(
            color: KOrangeColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: Icon(
            icon,
            color: KOrangeColor,
          ),
          enabledBorder: _customBorder(),
          focusedBorder: _customBorder(),
          errorBorder: _customBorder(),
          focusedErrorBorder: _customBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: KOrangeColor,
        width: 1.5,
      ),
    );
  }
}
