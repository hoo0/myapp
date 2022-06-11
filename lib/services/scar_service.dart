import 'dart:convert';

import 'package:myapp/constants.dart';
import 'network_service.dart';

const url = '/com.korail.mobile.research.TrainResearch';

class SrcarService {
  static Future<dynamic> getSrcar({required String dptDt, required String trnNo, required String dptStnCd, required String arvStnCd, required String psrmClCd}) async {
    return NetworkService.getData(
      '$baseUrl$url?Device=$device&Version=$version'
      '&txtMenuId=11&txtDptDt=$dptDt&txtTrnNo=$trnNo&txtDptRsStnCd=$dptStnCd&txtArvRsStnCd=$arvStnCd&txtPsrmClCd=$psrmClCd&txtSeatAttCd=015&txtTotPsgCnt=1',
    ).then((response) => jsonDecode(response.data));
  }
}
