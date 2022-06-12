import '../constants.dart';
import 'train_schedule.dart';

class Train {
  final String trnNo;
  final String runDt;
  final String dptDt;
  final String trnClsfCd;
  final String trnGpCd;
  final String dptStnCd;
  final String arvStnCd;
  final String dptStnNm;
  final String arvStnNm;
  final String dptTm;
  final String arvTm;
  final String dptTmQb;
  final String arvTmQb;
  final int dptStnRunOrdr;
  final int arvStnRunOrdr;
  late TrainSchedule schedule;

  Train({
    required this.trnNo,
    required this.runDt,
    required this.dptDt,
    required this.trnClsfCd,
    required this.trnGpCd,
    required this.dptStnCd,
    required this.arvStnCd,
    required this.dptStnNm,
    required this.arvStnNm,
    required this.dptTm,
    required this.arvTm,
    required this.dptTmQb,
    required this.arvTmQb,
    required this.dptStnRunOrdr,
    required this.arvStnRunOrdr,
  });

  static Train createByTrnInfo(Map<String, dynamic> trnInfo) {
    return Train(
      trnNo: convertTrnNo(trnInfo['h_trn_no']),
      runDt: trnInfo['h_run_dt'],
      dptDt: trnInfo['h_dpt_dt'],
      trnClsfCd: trnInfo['h_trn_clsf_cd'],
      trnGpCd: trnInfo['h_trn_gp_cd'],
      dptStnCd: trnInfo['h_dpt_rs_stn_cd'],
      arvStnCd: trnInfo['h_arv_rs_stn_cd'],
      dptStnNm: trnInfo['h_dpt_rs_stn_nm'],
      arvStnNm: trnInfo['h_arv_rs_stn_nm'],
      dptTm: trnInfo['h_dpt_tm'],
      arvTm: trnInfo['h_arv_tm'],
      dptTmQb: trnInfo['h_dpt_tm_qb'],
      arvTmQb: trnInfo['h_arv_tm_qb'],
      dptStnRunOrdr: int.parse(trnInfo['h_dpt_stn_run_ordr']),
      arvStnRunOrdr: int.parse(trnInfo['h_arv_stn_run_ordr']),
    );
  }

  String get trnGpName {
    return trnGpCdMap[trnGpCd] ?? trnGpCd;
  }

  static String convertTrnNo(String trnNo) {
    int iTrnNo = int.parse(trnNo);
    String sTrnNo = iTrnNo.toString();
    int length = sTrnNo.length;

    for (int i = 0; i < 5 - length; i++) {
      sTrnNo = '0' + sTrnNo;
      // debugPrint('sTrnNo=$sTrnNo');
    }

    return sTrnNo;
  }
}
