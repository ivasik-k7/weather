import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wapp/domain/models/weather/weather.dart';

part 'weather_client.g.dart';

@RestApi(baseUrl: 'http://api.openweathermap.org/data/2.5')
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET("/weather")
  Future<WeatherModel> getWeather(
    @Query('appid') String appId,
    @Query('q') String location,
    @Query('lang') String? lang,
    @Query('units') String? measurement,
  );
}
