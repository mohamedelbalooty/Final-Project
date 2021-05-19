import 'package:final_project/constants.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customLogo.dart';
import 'package:final_project/widgets/shared_view_widgets/customTextField.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'user_home_navigation.dart';
import 'user_signUp_view.dart';

// ignore: must_be_immutable
class UserSignInView extends StatelessWidget {
  static String id = 'UserSignInView';

  String _email, _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  SizedBox _distance = SizedBox(
    height: 10.0,
  );

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
          backgroundColor: Colors.transparent,
          body: Form(
            key: _globalKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customBackground(isPortrait, height, width, 'Asset 4'),
                  _distance,
                  customLogo(),
                  _distance,
                  CustomTextField(
                    label: 'البريد الالكتروني',
                    icon: Icons.email_outlined,
                    onClick: (String value) {
                      _email = value;
                    },
                  ),
                  _distance,
                  CustomTextField(
                    label: 'كلمة المرور',
                    icon: Icons.lock_outline,
                    onClick: (String value) {
                      _password = value;
                    },
                  ),
                  _distance,
                  InkWell(
                    onTap: () {
                      _validate(context);
                    },
                    child: customAuthenticationButton(width, 'تسجيل الدخول', [KGradientColor, Colors.deepOrangeAccent], (){
                      _validate(context);
                    }),
                  ),
                  customAuthenticationQuestion(context, 'لا تمتلك حساب ؟',
                      'انشاء حساب جديد', UserSignUpView.id),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _validate(context) {
    if (_globalKey.currentState.validate()) {
      try {
        _globalKey.currentState.save();
        Navigator.pushReplacementNamed(context, UserHomeNavigation.id);
      } on PlatformException catch (exception) {
        //TODO Handel Exception
        Toast.show(exception.message, context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
  }
}
