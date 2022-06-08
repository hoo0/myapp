import 'dart:collection';
import 'package:flutter/cupertino.dart';

import 'package:myapp/models/train.dart';

class ScheduleData extends ChangeNotifier {
  bool isLogin = false;
  String? dptDt;
  String? dptTm;
  String? dptStn;
  String? arvStn;

  final List<Map<String, dynamic>> stations = [];

  void setLogin() {
    isLogin = true;

    notifyListeners();
  }
}
