import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
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
