import 'package:flutter/material.dart';
import 'package:weather_app/presentations/home/widgets/weather_list_item.dart';
import 'package:weather_app/resources/images.dart';

class WeatherDaysList extends StatefulWidget {
  const WeatherDaysList({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherDaysList> createState() => _WeatherDaysListState();
}

class _WeatherDaysListState extends State<WeatherDaysList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: [
                  WeatherListItem(
                    dayName: 'Monday',
                    icon: Images.ic01d,
                    degrees: '10',
                  ),
                  Divider(),
                  WeatherListItem(
                    dayName: 'Tuesday',
                    icon: Images.ic01d,
                    degrees: '15',
                  ),
                  Divider(),
                  WeatherListItem(
                    dayName: 'Wednesday',
                    icon: Images.ic02d,
                    degrees: '14',
                  ),
                  Divider(),
                  WeatherListItem(
                    dayName: 'Thursday',
                    icon: Images.ic09d,
                    degrees: '14',
                  ),
                ],
              ),
          ),
      ),
    );
  }
}