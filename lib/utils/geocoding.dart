import 'package:example/utils/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeocodingService {
  static Future<List<Location>?> getLocationsFromAddress(String address) async {
    try {
      return await GeocodingPlatform.instance?.locationFromAddress(address);
    } catch (e) {
      // Handle any errors that occurred during the geocoding process
      print(e);
      return null;
    }
  }

  static Future<String?> getLocationsFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark>? list = await GeocodingPlatform.instance?.placemarkFromCoordinates(latitude, longitude);

      if (list?.isNotEmpty ?? false) {
        Placemark location = list!.first;
        print(location.toJson());
        return "${location.country}, ${location.street}";
      } else {
        return null;
      }
    } catch (e) {
      // Handle any errors that occurred during the reverse geocoding process
      print(e);
      return null;
    }
  }

  static Future<String?> getCurrentLocation() async {

    await LocationPermissionHandler().requestLocationPermission();
    final result = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return await getLocationsFromCoordinates(result.latitude, result.longitude);
  }

}
