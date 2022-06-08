import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/screens/schedule2_calendarsub_screen.dart';
import 'package:myapp/screens/schedule2_calendar_screen.dart';

import '../flutter_flow_theme.dart';
import '../widgets/flutter_flow_icon_button.dart';
import 'schedule2_section_screen.dart';

class Schedule2Screen extends StatefulWidget {
  const Schedule2Screen({Key? key}) : super(key: key);

  @override
  _Schedule2ScreenState createState() => _Schedule2ScreenState();
}

class _Schedule2ScreenState extends State<Schedule2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const ScheduleSectionScreen(),
              const ScheduleCalendarScreen(),
              const ScheduleCalendarsubScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
