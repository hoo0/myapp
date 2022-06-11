import 'package:flutter/cupertino.dart';

class Storage {
  late String text;

  static final Storage _instance = Storage._internal();

  factory Storage() => _instance;

  Storage._internal() {
    // 초기화
    text = 'hello world';
    debugPrint('init');
  }

  void print() {
    debugPrint('text=$text');
  }
}
