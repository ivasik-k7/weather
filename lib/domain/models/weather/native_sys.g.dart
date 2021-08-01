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
    sunset: dateFromJson(json['sunset'] as int),
    sunrise: dateFromJson(json['sunrise'] as int),
  );
}

Map<String, dynamic> _$WeatherNativeToJson(WeatherNative instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'country': instance.country,
      'message': instance.message,
      'sunset': dateToJson(instance.sunset),
      'sunrise': dateToJson(instance.sunrise),
    };
