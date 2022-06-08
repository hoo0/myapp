import 'package:flutter/material.dart';

import '../flutter_flow_theme.dart';

class ScheduleCalendarScreen extends StatelessWidget {
  const ScheduleCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  '출발일',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                        color: Color(0xFF8D8D8D),
                        fontSize: 16.0,
                        // fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Text(
                    '2022년 04월 05일 (화) 08:49',
                    style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                          color: Color(0xFF004676),
                          fontSize: 24.0,
                          // fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF8D8D8D),
                  size: 20,
                ),
              ),
            ],
          ),
          Divider(
            height: 0.2,
            color: Color(0xFFBABABA),
          ),
        ],
      ),
    );
  }
}
