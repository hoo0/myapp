import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../constants.dart';
import 'network_service.dart';

const url = '/com.korail.mobile.seatMovie.ScheduleView';

class ScheduleService {
  static Future<dynamic> getSchedule({
    required String trnGpCd,
    required String dptDt,
    required String dptTm,
    required String dptStn,
    required String arvStn,
  }) async {
    return NetworkService.getData(
      '$baseUrl$url?Device=$device&Version=$version&radJobId=1'
      '&txtMenuId=11&txtGoAbrdDt=$dptDt&txtGoHour=${dptTm}00'
      '&txtGoStart=$dptStn&txtGoEnd=$arvStn&txtTrnGpCd=$trnGpCd&txtSeatAttCd_4=015&txtPsgFlg_1=1&',
    ).then((response) => jsonDecode(response.data));
  }
}
/*
Device
Version
Key
radJobId
ebizCrossCheck
rtYn
srtCheckYn
txtJobDv
txtMenuId
txtGoAbrdDt
txtGoStart
txtGoEnd
selGoTrain
txtTrnGpCd
selGoRoom
txtGoHour
txtGoTrnNo
txtSeatAttCd_4
txtPsgFlg_1
txtPsgFlg_2
txtPsgFlg_3
txtPsgFlg_4
txtPsgFlg_5
selGoService
txtCardPsgCnt
adjStnScdlOfrFlg
etrPath
tkDptDt
tkDptTm
tkTrnNo
tkTripChgQryFlg
mbCrdNo
     */
