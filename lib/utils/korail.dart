import 'dart:convert';
import 'package:encrypt/encrypt.dart';

import '../constants.dart';

const secureKey = 'e00bc84be189dce9';

class KorailService {
  static String get sid {
    const wctNo = mtitWctNo;
    final plainText = wctNo + DateTime.now().millisecondsSinceEpoch.toString();
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromUtf8(secureKey);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final base64UrlEncoded = base64Url.encode(encrypted.bytes);

    return base64UrlEncoded;
  }
}
