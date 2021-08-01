import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class WeatherMain extends Equatable {
  const WeatherMain({
    this.condition,
    this.feels,
    this.max,
    this.min,
    this.pressure,
    this.humidity,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> map) =>
      _$WeatherMainFromJson(map);

  @JsonKey(name: "temp")
  final double? condition;
  @JsonKey(name: "feels_like")
  final double? feels;
  @JsonKey(name: "temp_max")
  final double? max;
  @JsonKey(name: "temp_min")
  final double? min;
  final int? pressure;
  final int? humidity;

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);

  @override
  List<Object?> get props => [condition, min, max, feels, humidity];

  @override
  bool? get stringify => true;
}
