import 'package:flutter/material.dart';

import '../flutter_flow_theme.dart';

class ScheduleCalendarsubScreen extends StatelessWidget {
  const ScheduleCalendarsubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    debugPrint('Button pressed ...');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          color: Color(0xFF8D8D8D),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    "달력에서 날짜 선택",
                    style: FlutterFlowTheme.of(context).subtitle2.copyWith(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                  ),
                ),
              ),
              // child: FFButtonWidget(
              //   onPressed: () {
              //     print('Button pressed ...');
              //   },
              //   text: '달력에서 날짜 선택',
              //   options: FFButtonOptions(
              //     width: double.infinity,
              //     height: 40,
              //     color: Colors.white,
              //     textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              //           color: Colors.black,
              //           fontSize: 16,
              //         ),
              //     borderSide: BorderSide(
              //       color: Color(0xFF8D8D8D),
              //       width: 1,
              //     ),
              //     borderRadius: 12,
              //   ),
              // ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF008EDA),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '11',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '12',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '13',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '14',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '15',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '16',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Color(0xFF008EDA),
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '17',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Color(0xFFDA0500),
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '18',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '19',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                fontFamily: 'KORAIL',
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          '출발일',
                          style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                color: Colors.white,
                                fontSize: 8.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
