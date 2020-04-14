import 'package:flutter/foundation.dart';

import '../base/locator.dart';
import '../base/models.dart';
import '../base/repositories.dart';

class GlobalStatsProvider extends ChangeNotifier {
  AppRepository _repository = locator<AppRepository>();

  GlobalStatsData _globalStatsData;
  LocalStatsData _localStatsData;

  GlobalStatsData get globalStatsData => _globalStatsData;
  LocalStatsData get localStatsData => _localStatsData;

  getGlobalStats() async {
    _globalStatsData = await _repository.getGlobalStats();
    notifyListeners();
  }

  getLocalStats() async {
    _localStatsData = await _repository.getLocalStats("Nepal");
    notifyListeners();
  }
}
