import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class WeatherWind extends Equatable {
  const WeatherWind({
    this.deg,
    this.speed,
  });

  factory WeatherWind.fromJson(Map<String, dynamic> map) =>
      _$WeatherWindFromJson(map);

  final double? speed;
  final int? deg;

  Map<String, dynamic> toJson() => _$WeatherWindToJson(this);

  @override
  List<Object?> get props => [deg, speed];
}
