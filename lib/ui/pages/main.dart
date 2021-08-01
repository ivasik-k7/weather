import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wapp/bloc/weather/weather_bloc.dart';
import 'package:wapp/ui/widgets/loader.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeather(location: 'Kyiv', unit: 'metric'));
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
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(
                'http://openweathermap.org/img/wn/${state.weather.weather?.first?.iconPath}@2x.png'),
          ),
          Text(
            state.weather.name ?? "No name",
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
                    Text('Temperature: ${state.weather.condition?.condition}'),
                    Text('Feels like: ${state.weather.condition?.feels}'),
                    Text('Minimum: ${state.weather.condition?.min}'),
                    Text('Maximal: ${state.weather.condition?.max}'),
                    Text('Pressure: ${state.weather.condition?.pressure} mm.'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Country: ${state.weather.nativeCondition?.country ?? "Undefined"}',
                    ),
                    Text(
                      'Type: ${state.weather.nativeCondition?.type ?? ""}',
                    ),
                    Text(
                      DateFormat("HH:mm:ss").format(
                        state.weather.nativeCondition?.sunrise ??
                            DateTime.now(),
                      ),
                    ),
                    Text(
                      DateFormat("HH:mm:ss").format(
                        state.weather.nativeCondition?.sunset ?? DateTime.now(),
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
