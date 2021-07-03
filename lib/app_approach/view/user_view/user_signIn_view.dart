import 'package:final_project/app_approach/controller/auth_service.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:final_project/provider/modalHud.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customLogo.dart';
import 'package:final_project/widgets/shared_view_widgets/customTextField.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'user_home_navigation.dart';
import 'user_signUp_view.dart';

// ignore: must_be_immutable
class UserSignInView extends StatelessWidget {
  static String id = 'UserSignInView';

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
            child: Form(
              key: _globalKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customBackground(isPortrait, height, width, 'Asset 4'),
                    SizedBox(
                      height: 10,
                    ),
                    customLogo(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'البريد الالكتروني',
                            icon: Icons.email_outlined,
                            onClick: (String value) {
                              _email = value;
                            },
                          ),
                          CustomTextField(
                            label: 'كلمة المرور',
                            icon: Icons.lock_outline,
                            onClick: (String value) {
                              _password = value;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _validate(context);
                            },
                            child: customAuthenticationButton(
                                width,
                                'تسجيل الدخول',
                                [KGradientColor, Colors.deepOrangeAccent], () {
                              _validate(context);
                            }),
                          ),
                        ],
                      ),
                    ),
                    customAuthenticationQuestion(context, 'لا تمتلك حساب ؟',
                        'انشاء حساب جديد', UserSignUpView.id),
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
          Navigator.pushNamed(context, UserHomeNavigation.id);
        }
      });
      modalHud.isChanging(false);
    }
    modalHud.isChanging(false);
  }
}
