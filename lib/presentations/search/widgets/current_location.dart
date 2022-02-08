import 'package:flutter/cupertino.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    Key? key,
    @required this.locationName
  }) : super(key: key);

  final locationName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.icLocation, color: Color(0xff010E82)),
          SizedBox(width: 14),
          Text(
              this.locationName,
              style: WeatherTheme.lightTheme.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
