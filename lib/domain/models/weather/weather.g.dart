// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    id: json['id'] as int?,
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : WeatherInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    condition: json['main'] == null
        ? null
        : WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
    time: json['dt'] == null ? null : DateTime.parse(json['dt'] as String),
    visibility: json['visibility'] as int?,
    wind: json['wind'] == null
        ? null
        : WeatherWind.fromJson(json['wind'] as Map<String, dynamic>),
    name: json['name'] as String?,
    nativeCondition: json['nativeCondition'] == null
        ? null
        : WeatherNative.fromJson(
            json['nativeCondition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather': instance.weather,
      'main': instance.condition,
      'dt': instance.time?.toIso8601String(),
      'visibility': instance.visibility,
      'wind': instance.wind,
      'nativeCondition': instance.nativeCondition,
      'name': instance.name,
    };