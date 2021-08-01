import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wapp/bloc/weather/weather_bloc.dart';
import 'package:wapp/domain/repositories/weather/weather_repository.dart';
import 'package:wapp/router.dart';
import 'package:wapp/ui/pages/main.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WeatherBloc(WeatherRepository()),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: $Router.generateRoute,
          home: MainPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ));
  }
}
