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
    time: dateFromJson(json['dt'] as int),
    visibility: json['visibility'] as int?,
    wind: json['wind'] == null
        ? null
        : WeatherWind.fromJson(json['wind'] as Map<String, dynamic>),
    name: json['name'] as String?,
    nativeCondition: json['sys'] == null
        ? null
        : WeatherNative.fromJson(json['sys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather': instance.weather,
      'main': instance.condition,
      'dt': dateToJson(instance.time),
      'visibility': instance.visibility,
      'wind': instance.wind,
      'sys': instance.nativeCondition,
      'name': instance.name,
    };
