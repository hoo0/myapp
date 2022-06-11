import 'package:flutter/material.dart';
// import 'package:flutter_custom_theme/flutter_custom_theme.dart';

import 'storage.dart';

// import 'flutter_flow_theme.dart';
import 'routes.dart';

void main() {
  Storage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: routesMap,
    );
  }
}
