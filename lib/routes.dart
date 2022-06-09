import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/welcome.dart';
import 'screens/login_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/schedule2_screen.dart';
import 'screens/trains_screen.dart';
import 'screens/srcars2_screen.dart';
// import 'screens/backup/seats_screen.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String);

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
    Path('/welcome', (context, pattern) => Welcome()),
    Path('/login', (context, pattern) => LoginScreen()),
    Path('/schedule', (context, pattern) => ScheduleScreen()),
    Path('/schedule2', (context, pattern) => Schedule2Screen()),
    Path('/trains', (context, pattern) {
      final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
      return TrainsScreen(args: args);
    }),
    Path('/srcars', (context, pattern) {
      final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
      return SrcarsScreen(args: args);
    }),
    // Path('/seatmap/seats', (context, pattern) {
    //   final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    //   return SeatsScreen(args: args);
    // }),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      // debugPrint('settings.name=${settings.name}');

      if (path.pattern == settings.name) {
        if (kIsWeb) {
          return NoAnimationMaterialPageRoute<void>(
            builder: (context) => path.builder(context, path.pattern),
            settings: settings,
          );
        }
        // debugPrint('path.name=${path.pattern}');
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, path.pattern),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
