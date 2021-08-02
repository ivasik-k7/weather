import 'package:get_it/get_it.dart';
import 'package:wapp/di/singletons/weather_config.dart';

GetIt locator = GetIt.instance;

void init() {
  locator.registerSingleton<WeatherClientConfig>(WeatherClientConfig());
}
