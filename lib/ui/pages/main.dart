import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wapp/bloc/weather/weather_bloc.dart';
import 'package:wapp/ui/widgets/loader.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(location: 'Kyiv'));
    return Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
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
    ));
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
      child: Text(state.weather.name ?? 'name'),
    );
  }
}
