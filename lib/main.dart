import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_custom_theme/flutter_custom_theme.dart';

import 'service_locator.dart';
import 'flutter_flow_theme.dart';
import 'routes.dart';
import 'models/schedule_data.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _customThemeOn = true;

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
      initialRoute: '/welcome',

      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', 'KR')
      ], //, Locale('pt', 'BR')],
    );
  }
}
