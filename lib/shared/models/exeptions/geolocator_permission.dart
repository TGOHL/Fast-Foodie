import 'package:geolocator/geolocator.dart';

class GeoLocatorPermissionExeption implements Exception {
  final String message;
  final LocationPermission state;

  GeoLocatorPermissionExeption(this.message, this.state);

  @override
  String toString() {
    return message;
  }
}
