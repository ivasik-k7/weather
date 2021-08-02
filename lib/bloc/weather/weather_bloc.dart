import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wapp/di/repositories/weather/weather_repository.dart';
import 'package:wapp/domain/models/weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.repository) : super(WeatherEmpty());

  final WeatherRepository repository;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherPending();
    if (event is FetchWeather) {
      try {
        final result = await repository.getWeather(
          event.location,
          lang: event.lang,
          unit: event.unit,
        );
        yield WeatherLoaded(result);
      } catch (e) {
        yield WeatherError(e.toString());
      }
    }
  }
}
