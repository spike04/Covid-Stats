import 'package:flutter/foundation.dart';

import '../base/locator.dart';
import '../base/models.dart';
import '../base/repositories.dart';

class LocalStatsProvider extends ChangeNotifier {
  AppRepository _repository = locator<AppRepository>();

  List<LocalStatsData> _localStatsDataList = [];

  List<LocalStatsData> get localStatsDataList => _localStatsDataList;

  getAllLocalStats() async {
    _localStatsDataList = await _repository.getAllLocalStats();
    notifyListeners();
  }
}
