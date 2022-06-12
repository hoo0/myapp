import 'package:flutter/cupertino.dart';

import 'screens/welcome.dart';
import 'screens/login_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/schedule2_screen.dart';
import 'screens/trains_screen.dart';
import 'screens/srcars2_screen.dart';

Map<String, WidgetBuilder> routesMap = {
  '/welcome': (context) => Welcome(),
  '/login': (context) => LoginScreen(),
  '/schedule': (context) => ScheduleScreen(),
  '/schedule2': (context) => Schedule2Screen(),
  '/trains': (context) => TrainsScreen(),
  '/srcars': (context) => SrcarsScreen(),
};
// TrainsScreen(args: ModalRoute.of(context)?.settings.arguments),
// final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
