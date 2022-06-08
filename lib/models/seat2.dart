import 'package:flutter/cupertino.dart';
import 'package:myapp/models/train.dart';
import 'package:myapp/models/train_schedule.dart';

import 'srcar.dart';
import 'seat_row.dart';

import '../utils/common.dart';

class Seat {
  final String seatNo;
  final String tkKndCd;
  final String dcntKndCd;
  final String dptRsStnCd;
  final String arvRsStnCd;
  final int dptStnRunOrdr;
  final int arvStnRunOrdr;
  final String btnClorVal;
  final String dcntCrdDvNm;
  final String rmk1Cont;
  final String aplFlg;

  Seat({
    required this.seatNo,
    required this.tkKndCd,
    required this.dcntKndCd,
    required this.dptRsStnCd,
    required this.arvRsStnCd,
    required this.dptStnRunOrdr,
    required this.arvStnRunOrdr,
    required this.btnClorVal,
    required this.dcntCrdDvNm,
    required this.rmk1Cont,
    required this.aplFlg,
  });

  static Seat createFromSeat(TrainSchedule schedule, Map<String, dynamic> seatInfo) {
    int dptStnRunOrdr = toRunOrdr(schedule, seatInfo['dptRsStnCd']);
    int arvStnRunOrdr = toRunOrdr(schedule, seatInfo['arvRsStnCd']);

    return Seat(
      seatNo: seatInfo['seatNo'],
      tkKndCd: seatInfo['tkKndCd'],
      dcntKndCd: seatInfo['dcntKndCd'],
      dptRsStnCd: seatInfo['dptRsStnCd'],
      arvRsStnCd: seatInfo['arvRsStnCd'],
      dptStnRunOrdr: dptStnRunOrdr,
      arvStnRunOrdr: arvStnRunOrdr,
      btnClorVal: seatInfo['btnClorVal'],
      dcntCrdDvNm: seatInfo['dcntCrdDvNm'],
      rmk1Cont: seatInfo['rmk1Cont'],
      aplFlg: seatInfo['aplFlg'],
    );
  }

  static int toRunOrdr(TrainSchedule schedule, rsStnCd) {
    return schedule.stationMap[rsStnCd] ?? -1;
  }

  @override
  String toString() {
    return '$seatNo $tkKndCd $dcntKndCd $dptRsStnCd $arvRsStnCd $btnClorVal $dcntCrdDvNm $rmk1Cont $aplFlg';
  }
}
/* stseatList
        "seatNo": "1A",
        "tkKndCd": "72",
        "dcntKndCd": "",
        "dptRsStnCd": "0015",
        "arvRsStnCd": "0501",
        "btnClorVal": "",
        "dcntCrdDvNm": "A정상",
        "rmk1Cont": ",",
        "aplFlg": ""
*/
