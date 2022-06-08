class TrainSchedule {
  final String trnClsfCd;
  final String trnGpCd;
  final List<TrainStation> stations;
  final Map<String, int> stationMap;

  TrainSchedule(this.trnClsfCd, this.trnGpCd, this.stations, this.stationMap);

  static TrainSchedule createByData(Map<String, dynamic> data) {
    List<TrainStation> trainStations = [];
    Map<String, int> stationMap = {};

    if (data['strResult'] == 'SUCC') {
      var stationInfos = data['time_infos']['time_info'] as List;

      for (int i = 0; i < stationInfos.length; i++) {
        var stationInfo = stationInfos[i];
        TrainStation trainStation = TrainStation.createByData(i, stationInfo);
        stationMap[trainStation.stopRsStnCd] = trainStation.runOrdr;
        trainStations.add(trainStation);
      }
    }

    return TrainSchedule(
      data['h_trn_clsf_cd'],
      data['h_trn_gp_cd'],
      trainStations,
      stationMap,
    );
  }
}

class TrainStation {
  final int runOrdr;
  final int stnConsOrdr;
  final String stopRsStnCd;
  final String stopRsStnNm;
  final String arvDt;
  final String arvTm;
  final String dptDt;
  final String dptTm;
  final int actArvDlayTnum;

  TrainStation(
    this.runOrdr,
    this.stnConsOrdr,
    this.stopRsStnCd,
    this.stopRsStnNm,
    this.arvDt,
    this.arvTm,
    this.dptDt,
    this.dptTm,
    this.actArvDlayTnum,
  );

  static TrainStation createByData(int index, Map<String, dynamic> data) {
    return TrainStation(
      index + 1,
      int.parse(data['h_stn_cons_ordr']),
      data['h_stop_rs_stn_cd'],
      data['h_stop_rs_stn_nm'],
      data['h_arv_dt'],
      data['h_arv_tm'],
      data['h_dpt_dt'],
      data['h_dpt_tm'],
      int.parse(data['h_act_arv_dlay_tnum']),
    );
  }
}
/*
h_trn_clsf_cd
h_trn_gp_cd
  h_stn_cons_ordr
  h_stop_rs_stn_cd
  h_stop_rs_stn_nm
  h_arv_dt
  h_arv_tm
  h_dpt_dt
  h_dpt_tm
  h_act_arv_dlay_tnum
 */
