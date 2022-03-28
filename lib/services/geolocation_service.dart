import 'package:geolocator/geolocator.dart';

import '../models/location_point.dart';

class GeolocationService {
  Future<LocationPoint> getLocationPoint() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Geolocation is turned off');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final point = await Geolocator.getCurrentPosition();
    print(point);
    return LocationPoint(
      lat: point.latitude,
      lon: point.longitude,
    );
  }
}
