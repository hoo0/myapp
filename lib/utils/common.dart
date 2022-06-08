import '../models/seat2.dart';

bool webmode = true;

String floor2(double num) {
  return num.toStringAsFixed(2);
}

bool isNumeric(String num) {
  if (int.tryParse(num) != null) {
    // debugPrint('a is a numeric string');
    return true;
  } else {
    // debugPrint('a is NOT a numeric string');
    return false;
  }
}

SeatInfo getSeatInfo(Seat seat, int seatRowCnt) {
  int row = 0;
  int col = 0;
  String type = "";

  var seatNo = seat.seatNo;
  var seatNoStart = seatNo.substring(0, seatNo.length - 1);
  var seatNoEnd = seatNo.substring(seatNo.length - 1, seatNo.length);
  // debugPrint("seatNo=${seat.seatNo} seatNoStart=$seatNoStart seatNoEnd=$seatNoEnd");

  // numeric
  if (int.tryParse(seatNoEnd) != null) {
    type = "N";

    int seatNum = int.parse(seatNo);
    int portion = (seatNum - 1) ~/ seatRowCnt + 1;
    int remainder = (seatNum - 1) % seatRowCnt + 1;

    row = portion;
    col = remainder;
  }
  // string
  else {
    type = "S";

    row = int.parse(seatNoStart);
    col = seatTypeList[seatNoEnd] ?? 0;
  }

  return SeatInfo(type, row, col);
}

var seatTypeList = {
  'A': 1,
  'B': 2,
  'C': 3,
  'D': 4
};

class SeatInfo {
  final String type;
  final int row;
  final int col;

  SeatInfo(this.type, this.row, this.col);
}
