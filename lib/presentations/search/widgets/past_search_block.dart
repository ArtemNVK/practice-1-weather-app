import 'package:flutter/material.dart';
import 'package:weather_app/presentations/search/widgets/past_search_item_widget.dart';
import 'package:weather_app/theme/weather_theme.dart';
import 'package:weather_app/widgets/link_text.dart';

class PastSearchBlock extends StatefulWidget {
  const PastSearchBlock({
    required this.pastSearchCities,
    required this.onClearAllTap,
    Key? key,
  }) : super(key: key);

  final List<String> pastSearchCities;
  final VoidCallback onClearAllTap;

  @override
  State<PastSearchBlock> createState() => _PastSearchBlockState();
}

class _PastSearchBlockState extends State<PastSearchBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Past Search',
                style: WeatherTheme.lightTheme.textTheme.headline2
            ),
            LinkText(text: 'Clear All', onTap: widget.onClearAllTap)
        ],
        ),
        Column(
          children: [
            for (final city in widget.pastSearchCities) ...[
              PastSearchItemWidget(
                  city: city,
                  onTap: () {},
              ),
              const SizedBox(height: 8),
            ],
        ],
        )
      ]
    );
  }
}
