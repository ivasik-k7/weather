import 'package:wapp/domain/models/weather/weather.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(String location);
}
