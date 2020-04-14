import 'package:json_annotation/json_annotation.dart';

part 'GlobalStatsData.g.dart';

@JsonSerializable()
class GlobalStatsData {
  int updated;
  int cases;
  int deaths;
  int recovered;

  GlobalStatsData({
    this.updated,
    this.cases,
    this.deaths,
    this.recovered,
  });

  factory GlobalStatsData.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalStatsDataToJson(this);
}
