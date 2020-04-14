// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GlobalStatsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalStatsData _$GlobalStatsDataFromJson(Map<String, dynamic> json) {
  return GlobalStatsData(
    updated: json['updated'] as int,
    cases: json['cases'] as int,
    deaths: json['deaths'] as int,
    recovered: json['recovered'] as int,
  );
}

Map<String, dynamic> _$GlobalStatsDataToJson(GlobalStatsData instance) =>
    <String, dynamic>{
      'updated': instance.updated,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
    };
