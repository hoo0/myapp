import 'package:flutter/foundation.dart';

import '../models/srcar.dart';

class SrcarsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String result = '';
  String message = '';
  final List<Srcar> srcars = [];

  void setResult(String result, String message) {
    this.result = result;
    this.message = message;
    notifyListeners();
  }

  void addAllSrcar(List<Srcar> srcars) {
    srcars.addAll(srcars);
    notifyListeners();
  }
}
