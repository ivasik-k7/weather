import 'package:get_it/get_it.dart';
import 'package:wapp/di/repositories/weather/weather_repository.dart';

final GetIt locator = GetIt.instance;

void init() {
  locator.registerFactory<WeatherRepository>(() => WeatherRepository());
}
