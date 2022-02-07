import 'package:flutter/material.dart';
import 'package:weather_app/presentations/home/widgets/clipper.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class WeatherToday extends StatefulWidget {
  const WeatherToday({
    Key? key,
    @required this.locationName
  }) : super(key: key);

  final locationName;

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                transform: Matrix4.translationValues(-215, 0, 0),
                child: ClipPath(
                  clipper: Clipper(),
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 0.0),
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(Images.ic01d)
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                transform: Matrix4.translationValues(220, 0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Row(
                          children: [
                            Image.asset(Images.icLocation),
                            Text(
                                widget.locationName,
                                style: WeatherTheme.lightTheme.textTheme.headline3
                            )
                          ],
                        ),
                      Row(
                        children: [
                          Text(
                              '12°',
                              style: WeatherTheme.lightTheme.textTheme.headline1
                          )
                        ]
                      ),
                      Row(
                        children: [
                          Text(
                              'Sunny and bright',
                              style: WeatherTheme.lightTheme.textTheme.headline2
                          )
                        ],
                      ),
                    ],
                  ),
              ),
          ],
        ),
      );
  }
}