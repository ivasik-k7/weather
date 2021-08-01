// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) {
  return WeatherMain(
    condition: (json['temp'] as num?)?.toDouble(),
    feels: (json['feels_like'] as num?)?.toDouble(),
    max: (json['temp_max'] as num?)?.toDouble(),
    min: (json['temp_min'] as num?)?.toDouble(),
    pressure: json['pressure'] as int?,
    humidity: json['humidity'] as int?,
  );
}

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.condition,
      'feels_like': instance.feels,
      'temp_max': instance.max,
      'temp_min': instance.min,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
