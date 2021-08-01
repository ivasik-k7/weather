// // class

import 'package:flutter/material.dart';
import 'package:wapp/routes.dart';
import 'package:wapp/ui/pages/main.dart';
import 'package:wapp/ui/pages/preferences.dart';

class $Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case $Routes.Main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case $Routes.Preferences:
        return MaterialPageRoute(builder: (_) => PreferencesPage());
      default:
        throw Exception('Undefined route name');
    }
  }
}
