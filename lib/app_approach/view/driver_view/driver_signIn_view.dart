import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'driver_home_navigation.dart';
import 'driver_profile_view.dart';
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
    return Stack(
      children: [
        customWallpaper(height, width),
        Scaffold(
          backgroundColor: KMainColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                customBackground(isPortrait, height, width, 'Asset 8'),
                SizedBox(
                  height: height * 0.09,
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DriverHomeNavigation.id);
                  },
                  child: customAuthenticationButton(
                    width,
                    'Sign In',
                    [Colors.deepOrangeAccent, KGradientColor],
                  ),
                ),
                customAuthenticationQuestion(context,
                    'Don\'t have an account ?', 'Register', DriverSignUpView.id)
              ],
            ),
          ),
        ),
      ],
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
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        keyboardType: txtType,
        style: TextStyle(
          color: KOrangeColor,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: KOrangeColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
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
        onSubmitted: (_) => null,
      ),
    );
  }
}
