import 'package:get_it/get_it.dart';

import '../../../app/app_state.dart';
import '../../../app/base_action.dart';
import '../../../app/operations.dart';
import '../../../services/geolocation_service.dart';

class GetGeolocationAction extends BaseAction {
  @override
  Operation get operationKey => Operation.getGeolocation;

  @override
  Future<AppState?> reduce() async {
    final geolocationService = GetIt.I.get<GeolocationService>();
    print(geolocationService.getLocationPoint());
    final point = await geolocationService.getLocationPoint();
    print('point $point');
    return state.rebuild((s) => s.profile.point = point);
  }
}
