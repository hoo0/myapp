import 'package:flutter/foundation.dart' show kIsWeb;

import '../models/seat2.dart';

const bool isWeb = kIsWeb;

var seatTypeList = {'A': 1, 'B': 2, 'C': 3, 'D': 4};

String floor2(double num) => num.toStringAsFixed(2);

bool isNumeric(String num) => int.tryParse(num) != null ? true : false;

SeatInfo getSeatInfo(Seat seat, int seatRowCnt) {
  String type = "";
  int row = 0;
  int col = 0;

  var seatNo = seat.seatNo;
  var seatNoStart = seatNo.substring(0, seatNo.length - 1);
  var seatNoEnd = seatNo.substring(seatNo.length - 1, seatNo.length);
  // debugPrint("seatNo=${seat.seatNo} seatNoStart=$seatNoStart seatNoEnd=$seatNoEnd");

  if (int.tryParse(seatNoEnd) != null) {
    // numeric
    type = "N";

    int seatNum = int.parse(seatNo);
    row = (seatNum - 1) ~/ seatRowCnt + 1;
    col = (seatNum - 1) % seatRowCnt + 1;
  } else {
    // string
    type = "S";

    row = int.parse(seatNoStart);
    col = seatTypeList[seatNoEnd] ?? 0;
  }

  return SeatInfo(type, row, col);
}

class SeatInfo {
  final String type;
  final int row;
  final int col;

  SeatInfo(this.type, this.row, this.col);
}
