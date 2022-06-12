import 'package:flutter/foundation.dart';

import '../models/train.dart';

class TrainProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late Train _train;
  Train get train => _train;

  void setTrain(Train train) {
    _train = train;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('count', count));
  // }
}
