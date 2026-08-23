import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceDetails {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getDeviceId() async {
    String deviceId = '';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo =
            await _deviceInfoPlugin.androidInfo;
        deviceId = androidDeviceInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor ?? '';
      }
    } catch (e) {
      print('Failed to get device id: $e');
    }

    return deviceId;
  }

  static Future<String> getDeviceName() async {
    String deviceName = '';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo =
            await _deviceInfoPlugin.androidInfo;
        deviceName = androidDeviceInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
        deviceName = iosDeviceInfo.name;
      }
    } catch (e) {
      print('Failed to get device name: $e');
    }

    return deviceName;
  }
}
