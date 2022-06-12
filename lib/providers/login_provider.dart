import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool showSpinner = false;

  void setShowSpinner(bool flag) {
    showSpinner = flag;
    notifyListeners();
  }
}
