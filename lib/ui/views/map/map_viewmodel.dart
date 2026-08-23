import 'package:dartz/dartz_unsafe.dart';
import 'package:example/models/provider.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:geolocator/geolocator.dart';
import "dart:ui" as ui;
import 'dart:convert';

class MapViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _commonService = locator<CommonService>();
  List<YachtModel> yachts = [];

  //////  Map Steps /////
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  Set<Marker> markers = <Marker>{};
  Position? position;

  Future initMap() async {
    print('initMap');
    setBusy(true);

    await LocationPermissionHandler().requestLocationPermission();

    try {
      // Check permission status
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        // Handle denied permission (show dialog, etc.)
        setBusy(false);
        // Optionally, notify the user
        debugPrint('Location permission denied');
        return;
      }

      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      // Handle the error gracefully
      debugPrint('Error getting location: $e');
      setBusy(false);
      // Optionally, notify the user
      return;
    }

    await getYachts();

    setBusy(false);
  }

  Future<Uint8List?> getBytesFromAsset({required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController.complete(controller);
    changeMapMode(controller);
    setIconMap();
    notifyListeners();
  }

  //this is the function to load custom map style json
  void changeMapMode(GoogleMapController mapController) {
    getJsonFile(Assets.json.mapStyle).then((value) {
      setMapStyle(value, mapController);
    });
  }

  //this is the function to load custom map style json
  void setIconMap() async {
    final Uint8List? markerIcon = await getBytesFromAsset(path: Assets.images.pin.path, width: 100);

    for (var element in yachts) {
      markers.add(Marker(
        markerId: MarkerId(element.id.toString()),
        position: LatLng((element.latitude ?? 0).toDouble(), (element.longitude ?? 0).toDouble()),
        infoWindow: InfoWindow(
          title: "${element.price.toString()} ${AppStrings.defaultCurrency}",
          snippet: "${element.name}",
          onTap: () {
            _navigationService.navigateToDetailsView(data: element);
          },
        ),
        draggable: false,
        icon: markerIcon == null ? BitmapDescriptor.defaultMarker : BitmapDescriptor.fromBytes(markerIcon),
      ));
    }
    notifyListeners();
  }

  //helper function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    return utf8.decode(list);
  }

  //helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }

  Future getYachts() async {
    try {
      // showLoading();
      final result = await _commonService.getYachts();
      result.fold(
        (error) => debugPrint('getYachts failed: ${error.message}'),
        (result) {
          yachts = result.data;
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      // hideLoading();
    }
  }
}
