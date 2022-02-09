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
    required this.onCityChosen,
    required this.pastSearchCities
  }) : super(key: key);

  final ValueNotifier<String> chosenCity;
  final VoidCallback onCityChosen;
  final List<String> pastSearchCities;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void onCloseTap() {
    setState(() {
      _controller.clear();
      _focusNode.unfocus();
    });
  }

  void onCityItemTap(String city) {
    setState(() {
      widget.pastSearchCities.add(city);
      widget.chosenCity.value = city;
      _focusNode.unfocus();
    });
    widget.onCityChosen.call();
    appRouter.goBack(context);
  }

  void onClearAllTap() {
    setState(() {
      widget.pastSearchCities.clear();
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
                GestureDetector(
                    onTap: () => appRouter.goBack(context),
                    child: CurrentLocation(chosenCity: widget.chosenCity.value)
                ),
                Divider(),
                PastSearchBlock(
                    pastSearchCities: widget.pastSearchCities,
                    onClearAllTap: onClearAllTap,
                ),
              ] else ...[
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (_, i) => CitiesListItemWidget(
                            item: testCities[i],
                            onTap: () => onCityItemTap(testCities[i].city)
                        ),
                        separatorBuilder: (_, i) => const Divider(height: 1, color: Colors.grey),
                        itemCount: testCities.length
                    ),
                )
              ]
            ],
          ),
      ),
    );
  }
}