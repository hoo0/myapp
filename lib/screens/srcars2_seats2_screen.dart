import 'package:flutter/material.dart';
import 'package:myapp/models/train_schedule.dart';

import '../models/seat_row.dart';
import '../services/seat2_service.dart';
import '../models/train.dart';
import '../models/srcar.dart';
import '../models/seat2.dart';
import '../utils/common.dart';
import '../widgets/seat_row_tile.dart';
import '../widgets/error_message.dart';

class SrcarSeatsScreen extends StatefulWidget {
  const SrcarSeatsScreen({Key? key, required this.train, required this.srcar}) : super(key: key);

  final Train train;
  final Srcar srcar;

  @override
  State<SrcarSeatsScreen> createState() => _SrcarSeatsScreen();
}

class _SrcarSeatsScreen extends State<SrcarSeatsScreen> with AutomaticKeepAliveClientMixin<SrcarSeatsScreen> {
  final List<Seat> seats = [];
  final List<Seat> seatRows = [];

  /* fourSeat */
  int rowIndex = 0;
  List<Seat> seat1List = [];
  List<Seat> seat2List = [];
  List<Seat> seat3List = [];
  List<Seat> seat4List = [];
  List<SeatRow> seatRowList = [];
  String seatNo1 = "";
  String seatNo2 = "";
  String seatNo3 = "";
  String seatNo4 = "";

  Widget bodyWidget = Container();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    callService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return bodyWidget;
  }

  void callService() async {
    try {
      var seatData = await SeatService.getSeat(
        train: widget.train,
        srcar: widget.srcar,
      );
      debugPrint('seatData=${seatData}');

      if (seatData['strResult'] == 'SUCC') {
        var stseatList = seatData['stseatList'] as List;

        for (int i = 0; i < stseatList.length; i++) {
          Map<String, dynamic> seatInfo = stseatList[i];
          debugPrint("seatInfo=$seatInfo");
          Seat seat = Seat.createFromSeat(widget.train.schedule, seatInfo);
          debugPrint("seatNo=${seat.toString()}");
          makeFourSeats(widget.train, widget.srcar, seat, i == stseatList.length - 1);
        }

        setState(() {
          bodyWidget = SeatList(seatRowList: seatRowList);
        });
      } else {
        setState(() {
          bodyWidget = ErrorMessage(message: seatData['msgTxt']);
        });
      }

      // debugPrint('scheduleData=$scheduleData');
    } catch (e) {
      debugPrint('e=$e');
    }
  }

  void makeFourSeats(Train train, Srcar srcar, Seat seat, bool last) {
    int seatRowCnt = srcar.psrmClCd == '2' ? 3 : 4;
    bool isNumber = isNumeric(seat.seatNo);

    // debugPrint('last=$last');
    // debugPrint('isNumber=$isNumber');

    SeatInfo seatInfo = getSeatInfo(seat, seatRowCnt);
    if (rowIndex == 0) {
      rowIndex = seatInfo.row;
    }

    if (rowIndex != seatInfo.row) {
      seatRowList.add(SeatRow(train, seatNo1, seatNo2, seatNo3, seatNo4, seat1List, seat2List, seat3List, seat4List));

      rowIndex = seatInfo.row;
      seat1List = [];
      seat2List = [];
      seat3List = [];
      seat4List = [];
      seatNo1 = "";
      seatNo2 = "";
      seatNo3 = "";
      seatNo4 = "";
    }
    // debugPrint('seat=${seat.seatNo} seatInfo=${seatInfo.type}/${seatInfo.row}/${seatInfo.col} rowIndex=$rowIndex');

    if (rowIndex == seatInfo.row) {
      if (seatInfo.col == 1) {
        seat1List.add(seat);
        seatNo1 = seat.seatNo;
      } else if (seatInfo.col == 2) {
        seat2List.add(seat);
        seatNo2 = seat.seatNo;
      } else if (seatInfo.col == 3) {
        seat3List.add(seat);
        seatNo3 = seat.seatNo;
      } else if (seatInfo.col == 4) {
        seat4List.add(seat);
        seatNo4 = seat.seatNo;
      }
    }

    if (last) seatRowList.add(SeatRow(train, seatNo1, seatNo2, seatNo3, seatNo4, seat1List, seat2List, seat3List, seat4List));
  }
}

class SeatList extends StatelessWidget {
  SeatList({Key? key, required this.seatRowList}) : super(key: key);

  final List<SeatRow> seatRowList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // scrollDirection: Axis.vertical,
      itemCount: seatRowList.length,
      itemBuilder: (context, index) => SeatRowTile(seatRow: seatRowList[index]),
      separatorBuilder: (BuildContext context, int index) => Divider(thickness: 1, height: 1),
    );
  }
}
