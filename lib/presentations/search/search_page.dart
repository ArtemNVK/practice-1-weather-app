import 'package:flutter/material.dart';
import 'package:weather_app/navigation/app_router.dart';
import 'package:weather_app/presentations/search/widgets/search_text_field.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);
  
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => appRouter.goBack(context),
              icon: Image.asset(Images.icClose),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    'Get Weather',
                    style: WeatherTheme.lightTheme.textTheme.headline5,
                ),
              ],
            ),
            SizedBox(height: 20),
            SearchTextField(),
          ],
        ),
      ),
    );
  }
}