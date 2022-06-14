import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../flutter_flow_theme.dart';
import '../widgets/flutter_flow_icon_button.dart';

class ScheduleSectionScreen extends StatelessWidget {
  const ScheduleSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      '출발',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                            color: Color(0xFF8D8D8D),
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 0.0,
                    borderWidth: 0.0,
                    buttonSize: 40.0,
                    icon: FaIcon(
                      FontAwesomeIcons.rightLeft,
                      color: Color(0xFF8D8D8D),
                      size: 20,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      '도착',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                            color: Color(0xFF8D8D8D),
                            fontSize: 16.0,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  // width: 100,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: TextFormField(
                      initialValue: '천안아산',
                      // controller: textController,
                      // onChanged: () {},
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                            fontFamily: 'Poppins',
                            color: Color(0xFF004676),
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF6F6F6F),
                  size: 24,
                ),
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: TextFormField(
                      initialValue: '천안아산',
                      // controller: textController,
                      // onChanged: () {},
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                            fontFamily: 'Poppins',
                            color: Color(0xFF004676),
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
