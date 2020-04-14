// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocalStatsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalStatsData _$LocalStatsDataFromJson(Map<String, dynamic> json) {
  return LocalStatsData(
    updated: json['updated'] as int,
    country: json['country'] as String,
    cases: json['cases'] as int,
    active: json['active'] as int,
    tests: json['tests'] as int,
    todayCases: json['todayCases'] as int,
    deaths: json['deaths'] as int,
    todayDeaths: json['todayDeaths'] as int,
    recovered: json['recovered'] as int,
    countryInfo: json['countryInfo'] == null
        ? null
        : CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocalStatsDataToJson(LocalStatsData instance) =>
    <String, dynamic>{
      'updated': instance.updated,
      'country': instance.country,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'active': instance.active,
      'tests': instance.tests,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'countryInfo': instance.countryInfo,
    };

CountryInfo _$CountryInfoFromJson(Map<String, dynamic> json) {
  return CountryInfo(
    flag: json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryInfoToJson(CountryInfo instance) =>
    <String, dynamic>{
      'flag': instance.flag,
    };
