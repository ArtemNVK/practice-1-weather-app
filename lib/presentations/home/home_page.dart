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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final _chosenCity = ValueNotifier('Cupertino');
  List<String> pastSearchCities = [];

  late AnimationController _animationController;
  late Animation<double> _curve;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animation = Tween<double>(begin: 0, end: 8).animate(_curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

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
                    route: SearchPage(
                        chosenCity: _chosenCity,
                        onCityChosen: () => setState(() {}),
                        pastSearchCities: pastSearchCities
                    ),
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
                    child: WeatherToday(
                      locationName: _chosenCity.value,
                      animation: _animation
                    ),
                  ),
                ),
                WeatherDaysList()
              ],
            ),
      )
    );
  }
}