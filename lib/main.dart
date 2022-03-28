import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';

import 'app/app_state.dart';
import 'app/store/store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencyInjection();

  final store = configureStore();

  runApp(
    StoreProvider<AppState>(
      store: store,
      child: const WeatherApp(),
    ),
  );
}
