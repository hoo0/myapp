import 'package:flutter/cupertino.dart';
import 'package:myapp/models/train.dart';
import 'package:myapp/models/train_schedule.dart';

import 'seat2.dart';

class SeatRow {
  final List<Seat> seat1List;
  final List<Seat> seat2List;
  final List<Seat> seat3List;
  final List<Seat> seat4List;
  final Train train;

  int segLength = 0;

  String seatNo1;
  String seatNo2;
  String seatNo3;
  String seatNo4;

  String seat1Txt = "";
  String seat2Txt = "";
  String seat3Txt = "";
  String seat4Txt = "";

  bool seat1Flg = true;
  bool seat2Flg = true;
  bool seat3Flg = true;
  bool seat4Flg = true;

  SeatRow(this.train, this.seatNo1, this.seatNo2, this.seatNo3, this.seatNo4, this.seat1List, this.seat2List, this.seat3List, this.seat4List) {
    makeSeatInfo(seat1List, 1);
    makeSeatInfo(seat2List, 2);
    makeSeatInfo(seat3List, 3);
    makeSeatInfo(seat4List, 4);

    // debugPrint("$seatNo1 $seat1Txt $seatNo2 $seat2Txt $seatNo3 $seat3Txt $seatNo4 $seat4Txt");
  }

  void makeSeatInfo(List<Seat> seatList, int index) {
    String seatTxt = "";

    for (int i = train.dptStnRunOrdr; i < train.arvStnRunOrdr; i++) {
      // i ~ i+1
      bool full = false;
      for (Seat seat in seatList) {
        // seat
        // debugPrint('seat=${seat.seatNo} train[${train.dptStnRunOrdr}-${train.arvStnRunOrdr}] ${seat.dptStnRunOrdr}-${seat.arvStnRunOrdr}');
        if (seat.dptStnRunOrdr <= i && i <= seat.arvStnRunOrdr - 1) {
          full = true;
          break;
        }
      }

      if (full) {
        seatTxt += "◆";
      } else {
        seatTxt += "◇";
      }

      if (index == 1) {
        segLength = train.arvStnRunOrdr - train.dptStnRunOrdr;
      }
    }

    if (index == 1 && seatNo1 != '') {
      seat1Txt = seatTxt;
    } else if (index == 2 && seatNo2 != '') {
      seat2Txt = seatTxt;
    } else if (index == 3 && seatNo3 != '') {
      seat3Txt = seatTxt;
    } else if (index == 4 && seatNo4 != '') {
      seat4Txt = seatTxt;
    }
  }
}
/*
 1A 1B 1C 1D
 1 2 3 4
 */
