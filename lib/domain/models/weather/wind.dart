import 'package:equatable/equatable.dart';

part 'wind.g.dart';

class WeatherWind extends Equatable {
  const WeatherWind({
    this.deg,
    this.speed,
  });

  final double? speed;
  final int? deg;

  @override
  List<Object?> get props => [deg, speed];
}
