import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:wapp/bloc/weather/weather_bloc.dart';
import 'package:wapp/di/singletons/weather_config.dart';
import 'package:wapp/ui/widgets/loader.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = GetIt.instance<WeatherClientConfig>();
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(
      location: client.location,
      unit: client.unit,
      lang: client.language,
    ));
    return SafeArea(
      child: Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (BuildContext context, WeatherState state) {
          if (state is WeatherEmpty) return buildEmpty();
          if (state is WeatherPending) return buildLoading();
          if (state is WeatherError) return buildError(state);
          if (state is WeatherLoaded) return buildWeatherCard(state);
          if (state is WeatherNoNetwork) return buildNoNetwork(state);
          return Container(
            child: Center(
              child: Text('Something went wrong'),
            ),
          );
        },
      )),
    );
  }

  Widget buildEmpty() {
    return Container(
      child: Center(
        child: Text('empty'),
      ),
    );
  }

  Widget buildError(WeatherError state) {
    return Container(
      child: Center(
        child: Text(state.error),
      ),
    );
  }

  Widget buildNoNetwork(WeatherNoNetwork state) {
    return Container(
      child: Center(
        child: Text(state.message),
      ),
    );
  }

  Widget buildLoading() {
    return Container(
      child: Center(
        child: Loader(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget buildWeatherCard(WeatherLoaded state) {
    final w = state.weather;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(
                'http://openweathermap.org/img/wn/${w.weather?.first?.iconPath}@2x.png'),
          ),
          Text(
            w.name ?? "No name",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${w.condition?.condition}'),
                    Text('Feels like: ${w.condition?.feels}'),
                    Text('Minimum: ${w.condition?.min}'),
                    Text('Maximal: ${w.condition?.max}'),
                    Text('Pressure: ${w.condition?.pressure} mm.'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Country:'),
                          Image.network(
                              'https://www.countryflags.io/${w.nativeCondition?.country ?? ""}/flat/24.png'),
                        ],
                      ),
                    ),
                    Text(
                      'Type: ${w.nativeCondition?.type ?? ""}',
                    ),
                    Text(
                      DateFormat("HH:mm:ss").format(
                        w.nativeCondition?.sunrise ?? DateTime.now(),
                      ),
                    ),
                    Text(
                      DateFormat("HH:mm:ss").format(
                        w.nativeCondition?.sunset ?? DateTime.now(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
