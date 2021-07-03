import 'package:flutter/cupertino.dart';

class OnClick extends ChangeNotifier{
  bool click = false;
  void isChanging(bool value){
    click = value;
    notifyListeners();
  }
}