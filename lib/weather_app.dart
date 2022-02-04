import 'package:flutter/material.dart';
import 'package:weather_app/presentations/home/home_page.dart';
import 'package:weather_app/resources/strings.dart';
import 'package:weather_app/theme/weather_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: Strings.appName,
        theme: WeatherTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}