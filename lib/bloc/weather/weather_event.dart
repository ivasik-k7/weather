part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  FetchWeather({
    required this.location,
    this.lang,
    this.unit,
  });

  final String location;
  final String? unit;
  final String? lang;
}
