import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/material.dart';

import 'package:final_project/constants.dart';

import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';

import 'driver_signIn_view.dart';

class DriverSignUpView extends StatelessWidget {
  static String id = 'DriverSignUpView';

  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _carNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Stack(
      children: [
        customWallpaper(height, width),
        Scaffold(
          backgroundColor: KMainColor,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  customBackground(isPortrait, height, width, 'Asset 8'),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Inputs(
                          icon: Icons.account_box,
                          inputType: 'Name',
                          controllerType: _name,
                          txtType: TextInputType.name,
                        ),
                        Inputs(
                          icon: Icons.phone,
                          inputType: 'Phone',
                          controllerType: _phone,
                          txtType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        //Inputs is a custom widget
                        Inputs(
                          icon: Icons.email,
                          inputType: 'Email',
                          controllerType: _email,
                          txtType: TextInputType.emailAddress,
                        ),
                        Inputs(
                          icon: Icons.lock_outline,
                          inputType: 'Password',
                          controllerType: _password,
                          txtType: TextInputType.visiblePassword,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Inputs(
                      icon: Icons.car_rental,
                      inputType: 'Car Number',
                      controllerType: _carNum,
                      txtType: TextInputType.number,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: KOrangeColor, width: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: KOrangeColor, width: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SignUp Button
                  customAuthenticationButton(width, 'Sign Up', [Colors.deepOrangeAccent, KGradientColor]),
                  customAuthenticationQuestion(context, 'Already have an account ?',
                      'Login', DriverSignInView.id)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Inputs extends StatelessWidget {
  final TextInputType txtType;
  final IconData icon;
  final String inputType;
  final controllerType;

  Inputs({this.icon, this.inputType, this.controllerType, this.txtType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        child: TextField(
          style: TextStyle(color: KOrangeColor),
          keyboardType: txtType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: KOrangeColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: KOrangeColor, width: 1.5),
            ),
            prefixIcon: Icon(
              icon,
              color: KOrangeColor,
            ),
            labelText: '$inputType',
            labelStyle:
                TextStyle(color: KOrangeColor, fontWeight: FontWeight.bold),
          ),
          controller: controllerType,
        ),
      ),
    );
  }
}
