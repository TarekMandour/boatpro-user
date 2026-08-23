import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:example/models/reservation_details.dart';
import 'package:example/services/rate_service.dart';
import 'package:example/services/reservation_service.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:example/models/provider.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:geolocator/geolocator.dart';
import "dart:ui" as ui;
import 'dart:convert';

class ReservationDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _reservationService = locator<ReservationService>();
  final _dialogService = locator<DialogService>();
  final _rateService = locator<RateService>();

  //////  Map Steps /////
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  Set<Marker> markers = <Marker>{};
  Position? position;
  bool isMapReady = false;

  ReservationDetailsModel? data;
  TextEditingController reasonController = TextEditingController();
  TextEditingController rateCommentController = TextEditingController();
  double ratingValue = 0;

  void navToEditReservation() {
    _navigationService
        .navigateToBookYachtView(
            yachtId: data?.id.toString() ?? '', isUpdate: true)
        .then((value) => getReservationDetails(data?.id.toString() ?? ''));
  }

  void reReserve() {
    _navigationService
        .navigateToBookYachtView(yachtId: data?.yacht?.id.toString() ?? '')
        .then((value) => getReservationDetails(data?.id.toString() ?? ''));
  }

  void navToPayReservation() {
    if (data != null) {
      _navigationService
          .navigateToConfirmReservationView(data: data!)
          .then((value) => getReservationDetails(data?.id.toString() ?? ''));
    }
  }

  Future getReservationDetails(String id) async {
    try {
      showLoading();
      isMapReady = false;
      notifyListeners();
      final result = await _reservationService.getReservationDetails(id);
      result.fold(
        (error) => debugPrint('getReservations failed: ${error.message}'),
        (result) {
          data = result.data;
          isMapReady = true;
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      hideLoading();
    }
  }

  Future cancelReservation(String id) async {
    // final result = await _dialogService.showDialog(
    //   title: translate(AppStrings.cancelReservation),
    //   description: translate(AppStrings.ksLoremDescription),
    //   buttonTitle: 'ok',
    //   buttonTitleColor: kcPrimaryColor,
    //   cancelTitle: 'cancel',
    //   cancelTitleColor: kcRedColor,
    // );
    // if (result?.confirmed ?? false) {
    try {
      showLoading();

      final result = await _reservationService.cancelReservation(id);
      result.fold(
        (error) => debugPrint('getReservations failed: ${error.message}'),
        (result) {
          getReservationDetails(id);
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      hideLoading();
    }
    // }
  }

  Future storeRate() async {
    try {
      showLoading();
      final result = await _rateService.storeRate(
        stars: ratingValue.toInt(),
        comment: rateCommentController.text,
        type: 'Yachts',
        typeId: data?.yacht?.id.toString() ?? '',
      );
      result.fold(
        (error) {
          debugPrint('storeRate failed: ${error.message}');
          BotToast.showText(
            text: error.message ?? 'Failed to submit review',
            contentColor: Colors.red,
            textStyle: const TextStyle(color: Colors.white),
          );
        },
        (result) {
          rateCommentController.clear();
          ratingValue = 0;
          notifyListeners();
          BotToast.showText(
            text: translate('Review_submitted_successfully'),
            contentColor: Colors.green,
            textStyle: const TextStyle(color: Colors.white),
          );
        },
      );
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      hideLoading();
    }
  }

  Future<Uint8List?> getBytesFromAsset(
      {required String path, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController.complete(controller);
    setIconMap();
    notifyListeners();
  }

  //this is the function to load custom map style json
  void setIconMap() async {
    final Uint8List? markerIcon =
        await getBytesFromAsset(path: Assets.images.pin.path, width: 100);

    markers.add(Marker(
        markerId: MarkerId(data?.id.toString() ?? ''),
        position: LatLng((data?.yacht?.latitude ?? 0).toDouble(),
            (data?.yacht?.longitude ?? 0).toDouble()),
        draggable: false,
        icon: markerIcon == null
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.fromBytes(markerIcon)));
    notifyListeners();
  }
}
