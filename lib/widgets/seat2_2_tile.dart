import 'package:flutter/material.dart';

import '../models/seat2.dart';
import '../services/station_service.dart';

class SeatTile extends StatelessWidget {
  SeatTile({Key? key, required this.seat}) : super(key: key);

  final Seat seat;

  @override
  Widget build(BuildContext context) {
    var rout = seat.dptRsStnCd == '' ? '' : seat.dptRsStnCd + '-' + seat.arvRsStnCd;
    rout = seat.dptRsStnCd == '' ? '' : StationService.getStationName(seat.dptRsStnCd) + '-' + StationService.getStationName(seat.arvRsStnCd);

    //debugPrint("seat=", seat);

    return InkWell(
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(5),
        // color: Colors.grey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(seat.seatNo, textAlign: TextAlign.right), flex: 2),
            Expanded(child: Container()),
            Expanded(child: Text(rout), flex: 6),
            Expanded(child: Text(seat.dcntCrdDvNm), flex: 3),
            Expanded(child: Text(seat.tkKndCd, textAlign: TextAlign.center), flex: 1),
            Expanded(child: Text(seat.dcntKndCd), flex: 3),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
