import 'package:json_annotation/json_annotation.dart';

part 'LocalStatsData.g.dart';

class LocalStatsDataList {
  final List<LocalStatsData> localStatsDataList;

  LocalStatsDataList({this.localStatsDataList});

  factory LocalStatsDataList.fromJson(List<dynamic> parsedJson) {
    return LocalStatsDataList(
      localStatsDataList:
          parsedJson.map((i) => LocalStatsData.fromJson(i)).toList(),
    );
  }
}

@JsonSerializable()
class LocalStatsData {
  int updated;
  String country;
  int cases;
  int todayCases;
  int active;
  int tests;
  int deaths;
  int todayDeaths;
  int recovered;
  CountryInfo countryInfo;

  LocalStatsData({
    this.updated,
    this.country,
    this.cases,
    this.active,
    this.tests,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.countryInfo,
  });

  factory LocalStatsData.fromJson(Map<String, dynamic> json) =>
      _$LocalStatsDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStatsDataToJson(this);
}

@JsonSerializable()
class CountryInfo {
  String flag;

  CountryInfo({this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);
}
