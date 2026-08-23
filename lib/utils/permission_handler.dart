import 'package:permission_handler/permission_handler.dart';

class LocationPermissionHandler {
  Future<bool> requestLocationPermission() async {
    // Check if the location permission is already granted
    if (await Permission.location.isGranted) {
      return true;
    }

    // Request the location permission
    var status = await Permission.location.request();

    // Return true if the permission is granted, false otherwise
    return status.isGranted;
  }

  Future<bool> hasLocationPermission() async {
    // Check if the location permission is granted
    return await Permission.location.isGranted;
  }
}
