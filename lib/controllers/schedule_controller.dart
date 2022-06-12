import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleController {
  static void logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('autoLogin', 'N');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  static void loadStns(Function? success) async {
    success = success ?? () {};

    try {
      final prefs = await SharedPreferences.getInstance();

      final String? dptStn = prefs.getString('dptStn');
      final String? arvStn = prefs.getString('arvStn');
      final String? trnGpCd = prefs.getString('trnGpCd');

      success(dptStn, arvStn, trnGpCd);
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
    }
  }

  static void saveStns(dptStn, arvStn, trnGpCd) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('dptStn', dptStn);
    await prefs.setString('arvStn', arvStn);
    await prefs.setString('trnGpCd', trnGpCd);
  }

  static void changeStns(TextEditingController dptStnController, TextEditingController arvStnController) {
    var dptStn = dptStnController.text;
    var arvStn = arvStnController.text;
    dptStnController.text = arvStn;
    arvStnController.text = dptStn;
  }
}
