import 'package:flutter/material.dart';
import 'package:myapp/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_custom_theme/flutter_custom_theme.dart';

import 'storage.dart';
import 'providers/schedule_provider.dart';
import 'providers/train_provider.dart';
import '../providers/srcars_provider.dart';

// import 'flutter_flow_theme.dart';
import 'routes.dart';

void main() {
  Storage();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ScheduleProvider()),
        ChangeNotifierProvider(create: (_) => TrainProvider()),
        ChangeNotifierProvider(create: (_) => SrcarsProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      builder: EasyLoading.init(),
    );
  }
}
