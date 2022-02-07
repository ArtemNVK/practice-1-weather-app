import 'package:flutter/material.dart';
import 'package:weather_app/theme/weather_theme.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    Key? key,
    required this.text,
    required this.onTap
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        this.text,
        style: WeatherTheme.lightTheme.textTheme.headline6,
      ),
    );
  }
}
