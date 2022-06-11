import 'dart:convert';

import 'network_service.dart';

// const url = 'https://script.google.com/macros/s/AKfycbwSVNK0vumjEfjxzvn3hpozLQ0yHrvpTMUZtVTDwJI/dev'; // dev
const url = 'https://script.google.com/macros/s/AKfycbxt5tRfnaRrKRLhKK8QXFs8I6KpJgkbUs93CI7nebI8bK14-uzTDUrrMfRPovRZK7OJ/exec'; // production

class LoginService {
  static dynamic callLogin({
    required String id,
    required String password,
  }) async {
    if (id == '' || password == '') {
      return {'status': 'FAIL', 'message': 'input null'};
    }

    var loginData = NetworkService.postData(url, {'id': id, 'password': password}).then((response) => jsonDecode(response.data));
    return loginData;
  }
}
