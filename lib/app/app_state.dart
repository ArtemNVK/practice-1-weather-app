import 'package:built_value/built_value.dart';
import 'package:dash_kit_core/dash_kit_core.dart';

import '../features/geolocation/geolocation_state.dart';

part 'app_state.g.dart';

abstract class AppState
    implements Built<AppState, AppStateBuilder>, GlobalState {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  AppState._();

  GeolocationState get profile;

  @override
  BuiltMap<Object, OperationState> get operationsState;

  @override
  T updateOperation<T extends GlobalState>(
    Object? operationKey,
    OperationState operationState,
  ) {
    final GlobalState newState = rebuild(
      (s) => s.operationsState[operationKey!] = operationState,
    );
    return newState as T;
  }

  @override
  OperationState getOperationState(Object operationKey) {
    return operationsState[operationKey] ?? OperationState.idle;
  }

  static AppState initial() {
    return AppState(
      (b) => b.profile = GeolocationState.initial().toBuilder(),
    );
  }
}
