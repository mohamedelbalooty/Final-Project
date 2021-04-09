import 'package:final_project/app_approach/view/driver_view/driver_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:final_project/constants.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'driver_signUp_view.dart';

class DriverSignInView extends StatelessWidget {
  static String id = 'DriverSignInView';
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: KMainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customBackground(isPortrait, height, width, 'Asset 5'),
            SizedBox(
              height: height * 0.2,
            ),
            Inputs(
              icon: Icons.email,
              inputType: 'Email',
              controllerType: email,
              txtType: TextInputType.emailAddress,
            ),
            Inputs(
              icon: Icons.lock_outline,
              inputType: 'Password',
              controllerType: password,
              txtType: TextInputType.visiblePassword,
            ),
            Container(
              width: width * 0.73,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Color(0xff0194fe),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, DriverProfileView.id),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            customAuthenticationQuestion(context, 'Don\'t have an account ?',
                'Register', DriverSignUpView.id)
          ],
        ),
      ),
    );
  }
}

//TextField
class Inputs extends StatelessWidget {
  final TextInputType txtType;
  final IconData icon;
  final String inputType;
  final controllerType;

  Inputs({this.icon, this.inputType, this.controllerType, this.txtType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        keyboardType: txtType,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          ),
          prefixIcon: Icon(
            icon,
            color: Color(0xffdcdfe4),
          ),
          labelText: '$inputType',
          labelStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        controller: controllerType,
        onSubmitted: (_) => null,
      ),
    );
  }
}
