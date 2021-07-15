import 'package:flutter/material.dart';
import 'package:human_resources/util/constant/locator.dart';
import 'package:human_resources/util/dialog_service.dart';
import 'package:human_resources/util/navigator.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  DialogService dialog = locator<DialogService>();
  NavigationService navigate = locator<NavigationService>();

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
