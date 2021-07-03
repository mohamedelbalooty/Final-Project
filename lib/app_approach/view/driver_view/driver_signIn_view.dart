import 'package:final_project/app_approach/controller/auth_service.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:final_project/provider/modalHud.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customLogo.dart';
import 'package:final_project/widgets/shared_view_widgets/customTextField.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'driver_home_navigation.dart';
import 'driver_signUp_view.dart';

// ignore: must_be_immutable
class DriverSignInView extends StatelessWidget {
  static String id = 'DriverSignInView';
  String _email, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      children: [
        customWallpaper(height, width),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: Provider.of<ModalHud>(context).isLoading,
            child: SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    customBackground(isPortrait, height, width, 'Asset 8'),
                    SizedBox(height: 15),
                    customLogo(),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          CustomTextField(
                            icon: Icons.email,
                            label: 'البريد الالكتروني',
                            onClick: (value) {
                              _email = value;
                            },
                          ),
                          CustomTextField(
                            icon: Icons.lock_outline,
                            label: 'كلمة المرور',
                            onClick: (value) {
                              _password = value;
                            },
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DriverHomeNavigation.id);
                            },
                            child: customAuthenticationButton(
                              width,
                              'تسجيل الدخول',
                              [Colors.deepOrangeAccent, KGradientColor],
                              () {
                                _validate(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    customAuthenticationQuestion(context, 'لا تمتلك حساب ؟',
                        'أنشاء حساب جديد', DriverSignUpView.id)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _validate(context) async {
    final modalHud = Provider.of<ModalHud>(context, listen: false);
    modalHud.isChanging(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      _globalKey.currentState.reset();
      Provider.of<AuthenticationResult>(context, listen: false)
          .savingEmail(_email);
      await Auth().signIn(_email, _password, context).then((value) {
        if (value != null) {
          Navigator.pushNamed(context, DriverHomeNavigation.id);
        }
      });
      modalHud.isChanging(false);
    }
    modalHud.isChanging(false);
  }
}
