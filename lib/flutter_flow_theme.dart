import 'package:flutter/material.dart';

class FlutterFlowTheme {
  final BuildContext context;
  const FlutterFlowTheme.of(this.context);

  get primaryColor => const Color(0xff3474E0);

  get bodyText1 => Theme.of(context).textTheme.bodyText1?.copyWith(
        fontFamily: 'KORAIL',
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        color: const Color(0xFF303030),
      );

  get subtitle2 => Theme.of(context).textTheme.subtitle2?.copyWith(
        fontFamily: 'KORAIL',
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        color: const Color(0xFF616161),
      );
}
