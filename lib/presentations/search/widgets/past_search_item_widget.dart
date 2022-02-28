import 'package:flutter/material.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class PastSearchItemWidget extends StatelessWidget {
  const PastSearchItemWidget({
    required this.city,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String city;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              this.city,
              style: WeatherTheme.lightTheme.textTheme.headline4
          ),
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
                Images.icClose,
                height: 12,
                width: 12,
            ),
          ),
        ],
      ),
    );
  }
  }