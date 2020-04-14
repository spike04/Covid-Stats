import 'package:get_it/get_it.dart';

import 'utils.dart';
import 'https.dart';
import 'repositories.dart';

final locator = GetIt.I;

setUpLocator() {
  locator.registerLazySingleton(() => API());
  locator.registerLazySingleton(() => ApiBaseHelper());
  locator.registerLazySingleton(() => AppRepository());
  locator.registerLazySingleton(() => Utils());
}
