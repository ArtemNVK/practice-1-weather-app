import 'package:flutter/material.dart';
import 'package:weather_app/models/city_item.dart';

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
      child: Row(
        children: [
          Text(item.city),
          CircleAvatar(),
          Text(item.country)
        ],
      ),
    );
  }
}
