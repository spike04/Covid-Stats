import '../base/https.dart';
import '../base/locator.dart';
import '../base/models.dart';
import '../base/utils.dart';

class AppRepository {
  ApiBaseHelper _apiBaseHelper = locator<ApiBaseHelper>();

  Future<GlobalStatsData> getGlobalStats() async {
    final response = await _apiBaseHelper.get(Constants.all);
    return GlobalStatsData.fromJson(response);
  }

  Future<LocalStatsData> getLocalStats(String country) async {
    final response =
        await _apiBaseHelper.get('${Constants.countries}/$country');
    return LocalStatsData.fromJson(response);
  }

  Future<List<LocalStatsData>> getAllLocalStats() async {
    final response = await _apiBaseHelper.get('${Constants.countries}');
    return LocalStatsDataList.fromJson(response).localStatsDataList;
  }
}
