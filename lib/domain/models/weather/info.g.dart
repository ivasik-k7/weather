// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return WeatherInfo(
    condition: json['main'] as String?,
    description: json['description'] as String?,
    iconPath: json['icon'] as String?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$WeatherInfoToJson(WeatherInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.condition,
      'description': instance.description,
      'icon': instance.iconPath,
    };
