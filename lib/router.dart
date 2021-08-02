// // class

import 'package:flutter/material.dart';
import 'package:wapp/routes.dart';
import 'package:wapp/ui/pages/home/home.info.dart';
import 'package:wapp/ui/pages/home/home.preferences.dart';
import 'package:wapp/ui/pages/splash.dart';

class $Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case $Routes.Main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case $Routes.Preferences:
        return MaterialPageRoute(builder: (_) => PreferencesPage());
      case $Routes.Splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      default:
        throw Exception('Undefined route name');
    }
  }
}
