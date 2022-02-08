import 'package:flutter/material.dart';
import 'package:weather_app/models/city_item.dart';
import 'package:weather_app/theme/weather_theme.dart';

class CitiesListItemWidget extends StatelessWidget {
  const CitiesListItemWidget({
    Key? key,
    required this.item,
    required this.onTap
  }) : super(key: key);

  final CityItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 17.0, bottom: 17.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(item.city, style: WeatherTheme.lightTheme.textTheme.headline4),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: CircleAvatar(
                    radius: 4.0,
                    backgroundColor: Color(0xffC4C4C4),
                  ),
                ),
                Text(item.country, style: WeatherTheme.lightTheme.textTheme.headline4),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
