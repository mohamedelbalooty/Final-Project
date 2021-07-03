import 'package:flutter/cupertino.dart';

class AuthenticationResult extends ChangeNotifier{
  String userId = '';
  void savingUserId(String value){
    userId = value;
    notifyListeners();
  }
  String emailing;
  void savingEmail(String value){
    emailing = value;
    notifyListeners();
  }
}