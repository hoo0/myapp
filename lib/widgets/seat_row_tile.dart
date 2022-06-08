import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

import '../models/seat2.dart';
import '../models/seat_row.dart';
import '../services/station_service.dart';

class SeatRowTile extends StatelessWidget {
  SeatRowTile({Key? key, required this.seatRow}) : super(key: key);

  final SeatRow seatRow;

  @override
  Widget build(BuildContext context) {
    // var rout = seat.dptRsStnCd == '' ? '' : seat.dptRsStnCd + '-' + seat.arvRsStnCd;
    // rout = seat.dptRsStnCd == '' ? '' : StationService.getStationName(seat.dptRsStnCd) + '-' + StationService.getStationName(seat.arvRsStnCd);

    // debugPrint("seatRow.segLength=${seatRow.segLength}");

    return InkWell(
      child: Container(
        height: 50,
        // padding: const EdgeInsets.all(5),
        // color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SeatTile(seatNo: seatRow.seatNo1, seatTxt: seatRow.seat1Txt, segLength: seatRow.segLength), flex: 4),
            Expanded(child: SeatTile(seatNo: seatRow.seatNo2, seatTxt: seatRow.seat2Txt, segLength: seatRow.segLength), flex: 4),
            Expanded(child: Container()),
            Expanded(child: SeatTile(seatNo: seatRow.seatNo3, seatTxt: seatRow.seat3Txt, segLength: seatRow.segLength), flex: 4),
            Expanded(child: SeatTile(seatNo: seatRow.seatNo4, seatTxt: seatRow.seat4Txt, segLength: seatRow.segLength), flex: 4),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class SeatTile extends StatelessWidget {
  const SeatTile({Key? key, required this.seatNo, required this.seatTxt, required this.segLength}) : super(key: key);

  final String seatNo;
  final String seatTxt;
  final int segLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 3,
            child: Text(
              seatNo,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            bottom: 3,
            child: Container(
              // color: Colors.grey,
              height: 20,
              alignment: Alignment.center,
              child: Text(
                seatTxt,
                style: TextStyle(fontSize: 10 * 8 / segLength > 10 ? 10 : 10 * 8 / segLength),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
