import 'dart:io';
import 'package:final_project/provider/authentication_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isSuccess = false;

  // ignore: missing_return
  Future<AuthResult> signIn(
      String email, String password, BuildContext context) async {
    try {
      final _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var _firebaseSignInUser = _authResult.user;
//      Provider.of<AuthenticationResult>(context, listen: false)
//          .savingUserId(_firebaseSignInUser.uid);
      return _authResult;
    } on SocketException {
      Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } on PlatformException catch (firebaseException) {
      switch (firebaseException.code) {
        case 'ERROR_NETWORK_REQUEST_FAILED':
          Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
        case 'ERROR_INVALID_EMAIL':
          Toast.show('هذا البريد غير صحيح! أعد ادخاله', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
        case 'ERROR_WRONG_PASSWORD':
          Toast.show('عفواً! كلمة المرور المستخدمة غير صحيحة', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
      }
    }
  }

  // ignore: missing_return
  Future<AuthResult> signUp(
      String email, String password, BuildContext context) async {
    try {
      final _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var _firebaseSignUpUser = _authResult.user;
//      Provider.of<AuthenticationResult>(context, listen: false)
//          .savingUserId(_firebaseSignUpUser.uid);
      return _authResult;
    } on SocketException {
      Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } on PlatformException catch (firebaseException) {
      print(firebaseException.code);
      switch (firebaseException.code) {
        case 'ERROR_NETWORK_REQUEST_FAILED':
          Toast.show('لايوجد اتصال! حاول الاتصال بالانترنت', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
        case 'ERROR_INVALID_EMAIL':
          Toast.show('هذا البريد غير صحيح! أعد ادخاله', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          Toast.show('عفواً! هذا البريد مسجل من قبل', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
        case 'ERROR_WEAK_PASSWORD':
          Toast.show('عفواً! كلمة المرور المستخدمة ضعيفة', context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          break;
      }
    }
  }
}
