import 'dart:io';
import 'package:final_project/app_approach/controller/api_services.dart';
import 'package:final_project/app_approach/controller/auth_service.dart';
import 'package:final_project/app_approach/controller/imageStorage_service.dart';
import 'package:final_project/app_approach/model/passenger.dart';
import 'package:final_project/provider/addNewPassenger.dart';
import 'package:final_project/provider/authentication_result.dart';
import 'package:final_project/provider/modalHud.dart';
import 'package:final_project/widgets/shared_view_widgets/customAddingImageButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationButton.dart';
import 'package:final_project/widgets/shared_view_widgets/customAuthenticationQuestion.dart';
import 'package:final_project/widgets/shared_view_widgets/customBackground.dart';
import 'package:final_project/widgets/shared_view_widgets/customLogo.dart';
import 'package:final_project/widgets/shared_view_widgets/customTextField.dart';
import 'package:final_project/widgets/shared_view_widgets/customWallpaper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../../../constants.dart';
import 'user_home_navigation.dart';
import 'user_signIn_view.dart';

// ignore: must_be_immutable
class UserSignUpView extends StatefulWidget {
  static String id = 'UserSignUpView';

  @override
  _UserSignUpViewState createState() => _UserSignUpViewState();
}

class _UserSignUpViewState extends State<UserSignUpView> {
  String _name, _email, _phone, _password, _imageUrl;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  File image;
  ImagePicker imagePicker = ImagePicker();

  Future getImage() async {
    final _pickedFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() async {
      if (_pickedFile != null) {
        image = File(_pickedFile.path);
        await ImageStorageService()
            .uploadImage(_pickedFile, context)
            .then((value) {
          setState(() {
            _imageUrl = value;
          });
        });
      } else {
        print('error');
      }
    });
  }

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
                    customBackground(isPortrait, height, width, 'Asset 5'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customLogo(),
                          customAddingImageButton(image, () {
                            getImage();
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'الاسم',
                            icon: Icons.person_outline,
                            onClick: (String value) {
                              _name = value.trim();
                            },
                          ),
                          CustomTextField(
                            label: 'البريد الالكتروني',
                            icon: Icons.email_outlined,
                            onClick: (String value) {
                              _email = value.trim();
                            },
                          ),
                          CustomTextField(
                            label: 'رقم الهاتف',
                            icon: Icons.phone,
                            onClick: (String value) {
                              _phone = value.trim();
                            },
                          ),
                          CustomTextField(
                            label: 'كلمة المرور',
                            icon: Icons.lock_outline,
                            onClick: (String value) {
                              _password = value.trim();
                            },
                          ),
                          customAuthenticationButton(width, 'انشاء حساب',
                              [KGradientColor, Colors.deepOrangeAccent], () {
                            _validate(context);
                          }),
                        ],
                      ),
                    ),
                    customAuthenticationQuestion(context, 'تمتلك حساب بالفعل ؟',
                        'تسجيل الدخول', UserSignInView.id),
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
      if (_imageUrl != null) {
        _globalKey.currentState.save();
        _globalKey.currentState.reset();
        Provider.of<AuthenticationResult>(context, listen: false)
            .savingEmail(_email);
        await Auth().signUp(_email, _password, context).then((value) async {
          if (value != null) {
            await ApiService().addNewPassenger(Passenger(
              id: Provider.of<AuthenticationResult>(context, listen: false)
                  .userId,
              name: _name,
              email: _email,
              password: _password,
              phone: _phone,
              image: _imageUrl,
            ));
            Provider.of<AddNewPassenger>(context, listen: false).addCurrentPassenger(Passenger(
              id: Provider.of<AuthenticationResult>(context, listen: false)
                  .userId,
              name: _name,
              email: _email,
              password: _password,
              phone: _phone,
              image: _imageUrl,
            ));
            Navigator.pushNamed(context, UserHomeNavigation.id);
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
