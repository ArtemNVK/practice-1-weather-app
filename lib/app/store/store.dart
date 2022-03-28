import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/store/redux_action_logger.dart';
import 'package:weather_app/app/store/redux_action_observer.dart';

import '../../services/geolocation_service.dart';
import '../app_state.dart';

Store<AppState> configureStore() {
  final actionLogger = ReduxActionLogger();
  final actionObserver = ReduxActionObserver();
  GetIt.I.registerSingleton<ReduxActionObserver>(actionObserver);

  return Store<AppState>(
    initialState: AppState.initial(),
    actionObservers: [
      actionObserver,
      actionLogger,
    ],
  );
}

void configureDependencyInjection() {
  final geolocationService = GeolocationService();

  GetIt.I.registerSingleton<GeolocationService>(geolocationService);
}
