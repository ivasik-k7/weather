import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'info.g.dart';

@JsonSerializable()
class WeatherInfo {
  const WeatherInfo({
    this.condition,
    this.description,
    this.iconPath,
    this.id,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> map) =>
      _$WeatherInfoFromJson(map);

  final int? id;
  @JsonKey(name: 'main')
  final String? condition;
  final String? description;
  @JsonKey(name: 'icon')
  final String? iconPath;

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}
