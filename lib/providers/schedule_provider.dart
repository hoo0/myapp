import 'package:flutter/foundation.dart';

class ScheduleProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late String trnGpCd;
  late String dptDt;
  late String dptTm;
  late String dptStn;
  late String arvStn;

  void setScheduleProvider(trnGpCd, dptDt, dptTm, dptStn, arvStn) {
    this.trnGpCd = trnGpCd;
    this.dptDt = dptDt;
    this.dptTm = dptTm;
    this.dptStn = dptStn;
    this.arvStn = arvStn;
    notifyListeners();
  }
}
