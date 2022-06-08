import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  const FlutterFlowIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.icon,
  }) : super(key: key);

  final dynamic onPressed;
  final dynamic borderColor;
  final dynamic borderRadius;
  final dynamic borderWidth;
  final dynamic buttonSize;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth ?? 0.0,
          color: borderColor ?? Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0.0) // POINT
            ),
      ),
      child: SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
