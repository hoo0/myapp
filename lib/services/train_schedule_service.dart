import 'dart:convert';

import '../constants.dart';
import 'network_service.dart';

const url = '/com.korail.mobile.trainsInfo.TrainSchedule';

class TrainScheduleService {
  static Future<dynamic> getTrainSchedule({
    required String runDt,
    required String trnNo,
    required String trnGpCd,
  }) async {
    return NetworkService.get(
      '$baseUrl$url',
      {
        'Device': device,
        'Version': version,
        'radJobId': '1',
        'txtRunDt': runDt,
        'txtTrnNo': trnNo,
        'txtTrnGpCd': trnGpCd,
      },
    ).then((response) => jsonDecode(response.data));
  }
}
/*
Device
Version
Key
txtRunDt
txtTrnNo
txtTrnGpCd
     */
