import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wapp/domain/models/weather/info.dart';
import 'package:wapp/domain/models/weather/main.dart';
import 'package:wapp/domain/models/weather/native_sys.dart';
import 'package:wapp/domain/models/weather/wind.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {
  const WeatherModel({
    this.id,
    this.weather,
    this.condition,
    this.time,
    this.visibility,
    this.wind,
    this.name,
    this.nativeCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> map) =>
      _$WeatherModelFromJson(map);

  final int? id;
  final List<WeatherInfo?>? weather;
  @JsonKey(name: 'main')
  final WeatherMain? condition;
  @JsonKey(name: 'dt')
  final DateTime? time;
  final int? visibility;
  final WeatherWind? wind;
  final WeatherNative? nativeCondition;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
        nativeCondition,
        time,
      ];

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  bool? get stringify => true;
}
