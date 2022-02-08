import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/resources/strings.dart';
import 'package:weather_app/theme/weather_theme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.controller,
    required this.focusNode,
    required this.onTap,
    required this.onCloseTap,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final VoidCallback onCloseTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        hintText: 'Enter city name',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            Images.icSearch,
            color: focusNode.hasFocus ? Colors.indigo.shade900 : Colors.grey,
          ),
        ),
        suffixIcon: focusNode.hasFocus
            ? GestureDetector(
          onTap: onCloseTap,
          child: Image.asset(Images.icClose),
        )
            : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: WeatherTheme.lightTheme.textTheme.headline3,
    );
  }
}