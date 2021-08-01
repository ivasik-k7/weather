part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherPending extends WeatherState {}

class WeatherLoaded extends WeatherState {
  WeatherLoaded(this.weather);

  final WeatherModel weather;

   @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  WeatherError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class WeatherNoNetwork extends WeatherState {
  WeatherNoNetwork(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
