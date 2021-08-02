import 'package:flutter/material.dart';
import 'package:wapp/app.dart';
import 'package:wapp/di/config.dart' as config;

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  config.setup();
  runApp(WeatherApp());
}
