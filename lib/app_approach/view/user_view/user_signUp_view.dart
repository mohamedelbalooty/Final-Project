import 'package:final_project/widgets/shared_view_widgets/customAddingImageButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customLogo.dart';
import 'package:final_project/widgets/shared_view_widgets/customTextField.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import '../../../constants.dart';
import 'user_signIn_view.dart';

// ignore: must_be_immutable
class UserSignUpView extends StatelessWidget {
  static String id = 'UserSignUpView';

  String _name, _email, _phone, _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
                  customBackground(isPortrait, height, width, 'Asset 5'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customLogo(),
                        customAddingImageButton(() {
                          //TODO ADDING IMAGE URL
                        }),
                      ],
                    ),
                  ),
                  CustomTextField(
                    label: 'Name',
                    icon: Icons.person_outline,
                    onClick: (String value) {
                      _name = value;
                    },
                  ),
                  CustomTextField(
                    label: 'Email',
                    icon: Icons.email_outlined,
                    onClick: (String value) {
                      _email = value;
                    },
                  ),
                  CustomTextField(
                    label: 'Phone',
                    icon: Icons.phone,
                    onClick: (String value) {
                      _phone = value;
                    },
                  ),
                  CustomTextField(
                    label: 'Password',
                    icon: Icons.lock_outline,
                    onClick: (String value) {
                      _password = value;
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _validate(context);
                    },
                    child: customAuthenticationButton(width, 'Sign Up', [KGradientColor, Colors.deepOrangeAccent]),
                  ),
                  customAuthenticationQuestion(context, 'Already have an account ?',
                      'Login', UserSignInView.id),
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
        //TODO SOMETHING
      } on PlatformException catch (exception) {
        //TODO Handel Exception
        Toast.show(exception.message, context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
  }
}
