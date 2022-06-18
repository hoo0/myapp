import 'dart:convert';

import '../constants.dart';
import '../utils/korail.dart';
import 'network_service.dart';
import '../models/train.dart';
import '../models/srcar.dart';

const url = '/api/mtit/check/seatView.do';

class SeatService {
  static Future<dynamic> getSeat({
    required Train train,
    required Srcar srcar,
  }) async {
    return NetworkService.post(
      '$mtitBaseUrl$url',
      {
        'version': mtitVersion,
        'wctNo': mtitWctNo,
        'cgPsId': mtitCgPsId,
        'trnsSysId': mtitTrnsSysId,
        'sid': KorailService.sid,
        'runDt': train.runDt,
        'trnNo': train.trnNo,
        'scarNo': srcar.srcarNo,
      },
    ).then((response) => jsonDecode(response.data));
  }
}
/*
version:170602
wctNo:24001
cgPsId:000000
trnsSysId:RM
sid:cCDySA4ednFSP0E07Fu9Y9jI6qP4T8cljEwFtCpO6wg=
runDt:20220310
trnNo:00232
scarNo:0005
*/
