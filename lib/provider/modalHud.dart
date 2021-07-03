import 'package:flutter/cupertino.dart';

class ModalHud extends ChangeNotifier {
  bool isLoading = false;

  void isChanging(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
