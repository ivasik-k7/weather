import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wapp/utils/helpers.dart';

part 'native_sys.g.dart';

@JsonSerializable()
class WeatherNative extends Equatable {
  const WeatherNative({
    this.id,
    this.type,
    this.country,
    this.message,
    this.sunset,
    this.sunrise,
  });

  factory WeatherNative.fromJson(Map<String, dynamic> map) =>
      _$WeatherNativeFromJson(map);

  final int? id;
  final int? type;
  final String? country;
  final double? message;
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime? sunset;
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime? sunrise;

  @override
  List<Object?> get props => [id, type, message];

  Map<String, dynamic> toJson() => _$WeatherNativeToJson(this);
}
