import 'package:get_it/get_it.dart';
import '../models/sample.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Sample>(Sample());
}
