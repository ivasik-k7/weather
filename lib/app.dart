import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:wapp/bloc/weather/weather_bloc.dart';
import 'package:wapp/di/repositories/weather/weather_repository.dart';
import 'package:wapp/router.dart';
import 'package:wapp/ui/pages/splash.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WeatherBloc(
              GetIt.instance<WeatherRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: $Router.generateRoute,
          home: SplashPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ));
  }
}
