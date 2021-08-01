// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherNative _$WeatherNativeFromJson(Map<String, dynamic> json) {
  return WeatherNative(
    id: json['id'] as int?,
    type: json['type'] as int?,
    country: json['country'] as String?,
    message: (json['message'] as num?)?.toDouble(),
    sunset: json['sunset'] == null
        ? null
        : DateTime.parse(json['sunset'] as String),
    sunrise: json['sunrise'] == null
        ? null
        : DateTime.parse(json['sunrise'] as String),
  );
}

Map<String, dynamic> _$WeatherNativeToJson(WeatherNative instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'country': instance.country,
      'message': instance.message,
      'sunset': instance.sunset?.toIso8601String(),
      'sunrise': instance.sunrise?.toIso8601String(),
    };
