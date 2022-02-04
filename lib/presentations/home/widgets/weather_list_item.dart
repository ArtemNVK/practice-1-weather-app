import 'package:flutter/material.dart';
import 'package:weather_app/theme/weather_theme.dart';

class WeatherListItem extends StatefulWidget{
  const WeatherListItem({
    Key? key,
    @required this.dayName,
    @required this.icon,
    @required this.degrees,
  }) : super(key: key);

  final dayName;
  final icon;
  final degrees;

  @override
  State<WeatherListItem> createState() => _WeatherListItemState();
}

class _WeatherListItemState extends State<WeatherListItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
            body: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.dayName,
                                  style: WeatherTheme.lightTheme.textTheme.headline4,
                                  maxLines: 1,
                                ),
                                Image.asset(widget.icon, height: 40, width: 40),
                              ],
                            )
                          ),
                          Text(
                              widget.degrees + '°',
                              style: WeatherTheme.lightTheme.textTheme.headline4
                          ),
                        ],
                      ),
                    ),
        ),
    );
  }
}