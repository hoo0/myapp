import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../services/login_service.dart';
import '../widgets/common.dart';

class LoginController {
  static void doLogin(BuildContext context, email, password) async {
    context.loaderOverlay.show();

    try {
      var loginData = await LoginService.callLogin(id: email, password: password);
      debugPrint('login_screen.doLogin: loginData=$loginData');

      context.loaderOverlay.hide();

      if (loginData['status'] != null && loginData['status'] == 'SUCCESS') {
        LoginController.saveEmailPassword(email, password);
        Navigator.pushNamedAndRemoveUntil(context, '/schedule', (route) => false);
      } else {
        LoginController.saveAutoLogin('N');
        Common.showMyDialog(context: context, message: loginData['message']);
      }
    } catch (e) {
      debugPrint('e=$e');

      context.loaderOverlay.hide();
      Common.showMyDialog(context: context, message: e.toString());
    }
  }

  static void saveAutoLogin(String autoLogin) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('autoLogin', autoLogin);
  }

  static void saveEmailPassword(email, password) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('autoLogin', 'Y');
  }

  static Future<void> loadEmailPassword(Function? success) async {
    success = success ?? () {};

    final prefs = await SharedPreferences.getInstance();

    final String autoLogin = prefs.getString('autoLogin') ?? 'N';
    final String email = prefs.getString('email') ?? '';
    final String password = prefs.getString('password') ?? '';

    success(autoLogin, email, password);
  }
}