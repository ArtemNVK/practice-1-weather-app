import 'package:flutter/material.dart';
import 'package:weather_app/resources/images.dart';
import 'package:weather_app/theme/weather_theme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    @required this.controller,
    @required this.focusNode,
    @required this.onTap,
    @required this.onCloseTap,
  }) : super(key: key);

  final controller;
  final focusNode;
  final onTap;
  final onCloseTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Image.asset(
            Images.icSearch,
            color: Colors.black.withOpacity(0.3)
        ),
        suffixIcon: IconButton(
            icon: Image.asset(Images.icClose),
            color: Colors.black,
            onPressed: onCloseTap,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        hintText: 'Enter city name',
        hintStyle: TextStyle(
          fontFamily: defaultFontFamily,
          color: Colors.black.withOpacity(0.5),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.1,
        )
      ),
    );
  }
}

