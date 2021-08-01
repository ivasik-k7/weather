import 'package:dio/dio.dart';
import 'package:wapp/domain/models/weather/weather.dart';
import 'package:wapp/domain/repositories/weather/weather_client.dart';
import 'package:wapp/domain/repositories/weather/weather_source.dart';

class WeatherRepository extends WeatherDataSource {
  WeatherRepository() {
    dio = Dio();
    apiClient = WeatherApiClient(dio);
  }

  Dio dio = Dio();
  late WeatherApiClient apiClient;

  String serviceKey = '54e5faf96875c763ff86e9730917c041';

  @override
  Future<WeatherModel> getWeather(
    String location, {
    String? lang = 'uk',
    String? unit = 'metric',
  }) =>
      apiClient.getWeather(
        serviceKey,
        location,
        lang,
        unit,
      );
}
