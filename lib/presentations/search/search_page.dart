import 'package:flutter/material.dart';
import 'package:weather_app/fixtures/city_items.dart';
import 'package:weather_app/navigation/app_router.dart';
import 'package:weather_app/presentations/home/home_page.dart';
import 'package:weather_app/presentations/search/widgets/cities_list_item_widget.dart';
import 'package:weather_app/presentations/search/widgets/current_location.dart';
import 'package:weather_app/presentations/search/widgets/past_search_block.dart';
import 'package:weather_app/presentations/search/widgets/search_text_field.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.chosenCity,
  }) : super(key: key);

  final ValueNotifier<String> chosenCity;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  var _pastSearchCities = ['Moscow', 'New York City'];

  void onCloseTap() {
    setState(() {
      _controller.clear();
      _focusNode.unfocus();
    });
  }

  void onCityItemTap(String city) {
    setState(() {
      _pastSearchCities.add(city);
      widget.chosenCity.value = city;
      _focusNode.unfocus();
      appRouter.goTo(context: context, route: HomePage());
    });
  }

  void onClearAllTap() {
    setState(() {
      this._pastSearchCities.clear();
    });
  }

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
            SearchTextField(
              controller: _controller,
              focusNode: _focusNode,
              onTap: () => setState(() {}),
              onCloseTap: onCloseTap
            ),
            SizedBox(height: 20),
            if (!_focusNode.hasFocus) ...[
              CurrentLocation(chosenCity: widget.chosenCity.value),
              Divider(),
              PastSearchBlock(
                  pastSearchCities: this._pastSearchCities,
                  onClearAllTap: onClearAllTap,
              ),
            ] else ...[
              Column(
                children: [
                  for (final city in testCities) ...[
                    CitiesListItemWidget(
                        item: city,
                        onTap: () => onCityItemTap(city.city),
                    )
                  ]
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}