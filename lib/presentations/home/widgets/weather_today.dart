import 'package:flutter/material.dart';
import 'package:weather_app/presentations/home/widgets/clipper.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class WeatherToday extends StatefulWidget {
  const WeatherToday({
    Key? key,
    required this.locationName,
    required this.animation
  }) : super(key: key);

  final locationName;
  final Animation<double> animation;

  @override
  State<WeatherToday> createState() => _WeatherTodayState();
}

class _WeatherTodayState extends State<WeatherToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) => Container(
                padding: EdgeInsets.only(top: widget.animation.value),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 15,
                      blurRadius: 100,
                      offset: const Offset(0, 50), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 0.5,
                    heightFactor: 1.0,
                    child: Image.asset(
                      Images.ic01d,
                      width: 350,
                      height: 350,
                    ),
                  ),
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