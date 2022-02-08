import 'package:flutter/material.dart';
import 'package:weather_app/navigation/app_router.dart';
import 'package:weather_app/presentations/home/widgets/weather_days_list.dart';
import 'package:weather_app/presentations/home/widgets/weather_today.dart';
import 'package:weather_app/resources/images.dart';

import '../search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final locationName = 'Cupertino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () => print('click'),
                icon: Image.asset(Images.icGeoMark)
            );
          },
        ),
        actions: [
              IconButton(
                  onPressed: () => appRouter.goTo(
                    context: context,
                    route: SearchPage(locationName: locationName),
                  ),
                  icon: Image.asset(Images.icSearch)
              )
            ],
      ),
      body: SafeArea(
        child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 400,
                    child: WeatherToday(locationName: locationName),
                  ),
                ),
                WeatherDaysList()
              ],
            ),
      )
    );
  }
}