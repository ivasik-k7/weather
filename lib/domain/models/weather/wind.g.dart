// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherWind _$WeatherWindFromJson(Map<String, dynamic> json) {
  return WeatherWind(
    deg: json['deg'] as int?,
    speed: (json['speed'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherWindToJson(WeatherWind instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
