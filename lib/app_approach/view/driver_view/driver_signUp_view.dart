import 'dart:io';

import 'package:final_project/app_approach/controller/auth_service.dart';
import 'package:final_project/app_approach/model/driver.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:final_project/provider/modalHud.dart';
import 'package:final_project/widgets/driver_view_widgets/driverImageAddingButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customTextField.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constants.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../../controller/api_services.dart';
import '../../controller/imageStorage_service.dart';
import 'driver_home_navigation.dart';
import 'driver_signIn_view.dart';

// ignore: must_be_immutable
class DriverSignUpView extends StatefulWidget {
  static String id = 'DriverSignUpView';

  @override
  _DriverSignUpViewState createState() => _DriverSignUpViewState();
}

class _DriverSignUpViewState extends State<DriverSignUpView> {
  String _name,
      _email,
      _phone,
      _password,
      _carNum,
      _profileImageUrl,
      _licenseImageUrl;
  double _price;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  File profileImage;
  File licenseImage;

  ImagePicker profileImagePicker = ImagePicker();
  ImagePicker licenseImagePicker = ImagePicker();

  Future getProfileImage() async {
    final _pickedFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() async {
      if (_pickedFile != null) {
        profileImage = File(_pickedFile.path);
        await ImageStorageService()
            .uploadImage(_pickedFile, context)
            .then((value) {
          setState(() {
            _profileImageUrl = value;
          });
        });
      } else {
        print('error');
      }
    });
  }

  Future getLicenseImage() async {
    final _pickedFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() async {
      if (_pickedFile != null) {
        licenseImage = File(_pickedFile.path);
        await ImageStorageService()
            .uploadImage(_pickedFile, context)
            .then((value) {
          setState(() {
            _licenseImageUrl = value;
          });
        });
      } else {
        print('error');
      }
    });
  }

  final SizedBox _distance = SizedBox(
    width: 5,
  );

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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  icon: Icons.account_box,
                                  label: 'الاسم',
                                  onClick: (String value) {
                                    _name = value;
                                  },
                                ),
                              ),
                              _distance,
                              Expanded(
                                child: CustomTextField(
                                  icon: Icons.phone,
                                  label: 'رقم الهاتف',
                                  onClick: (String value) {
                                    _phone = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  icon: Icons.email,
                                  label: 'البريد الالكتروني',
                                  onClick: (String value) {
                                    _email = value;
                                  },
                                ),
                              ),
                              _distance,
                              Expanded(
                                child: CustomTextField(
                                  icon: Icons.lock_outline,
                                  label: 'كلمة المرور',
                                  onClick: (String value) {
                                    _password = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  icon: Icons.drive_eta,
                                  label: 'رقم السيارة',
                                  onClick: (String value) {
                                    _carNum = value;
                                  },
                                ),
                              ),
                              _distance,
                              Expanded(
                                child: CustomTextField(
                                  icon: Icons.monetization_on_outlined,
                                  label: 'تسعيرة الرحلة',
                                  onClick: (String value) {
                                    _price = double.parse(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                imageButton('assets/images/photos/Asset 10.png',
                                    profileImage, () {
                                  getProfileImage();
                                }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                imageButton('assets/images/photos/Asset 11.png',
                                    licenseImage, () {
                                  getLicenseImage();
                                }),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DriverHomeNavigation.id);
                            },
                            child: customAuthenticationButton(
                                width,
                                'انشاء حساب',
                                [Colors.deepOrangeAccent, KGradientColor], () {
                              _validate(context);
                            }),
                          ),
                        ],
                      ),
                    ),
                    //SignUp Button
                    customAuthenticationQuestion(context, 'لديك حساب بالفعل ؟',
                        'تسجيل الدخول', DriverSignInView.id),
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
      if (_profileImageUrl != null && _licenseImageUrl != null) {
        _globalKey.currentState.save();
        _globalKey.currentState.reset();
        Provider.of<AuthenticationResult>(context, listen: false)
            .savingEmail(_email);
        await Auth().signUp(_email, _password, context).then((value) async {
          if (value != null) {
            await ApiService().addNewDriver(Driver(
              id: Provider.of<AuthenticationResult>(context, listen: false)
                  .userId,
              name: _name,
              email: _email,
              password: _password,
              phone: _phone,
              profileImage: _profileImageUrl,
              licenseImage: _licenseImageUrl,
              carNumber: _carNum,
              price: _price,
            ));
            Navigator.pushNamed(context, DriverHomeNavigation.id);
          }
        });
        modalHud.isChanging(false);
      } else {
        Toast.show('عفواً! يجب ادخال الصورة الشخصية', context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
    modalHud.isChanging(false);
  }
}
