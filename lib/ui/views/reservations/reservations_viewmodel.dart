import 'package:example/models/reservation.dart';
import 'package:example/services/reservation_service.dart';
import 'package:example/ui/index.dart';

class ReservationsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _reservationService = locator<ReservationService>();

  List<ReservationModel> list = [];
  List<ReservationModel> completedList = [];
  List<ReservationModel> inProgressList = [];

  void navigateToReservationDetailsView(String yachtId, bool reReserve) {
    _navigationService
        .navigateToReservationDetailsView(
            reReserve: reReserve, yachtId: yachtId)
        .then((value) async => await getReservations(isRefresh: false));
  }

  Future getReservations({bool isRefresh = true}) async {
    try {
      if (isRefresh) showLoading();
      final result = await _reservationService.getReservations();
      result.fold(
        (error) => debugPrint('getReservations failed: ${error.message}'),
        (result) {
          list.clear();
          completedList.clear();
          inProgressList.clear();
          for (var element in result.data) {
            if (element.reservationsStatus == 'in progress') {
              inProgressList.add(element);
            }
          }
          for (var element in result.data) {
            if (element.reservationsStatus == 'completed') {
              completedList.add(element);
            }
          }
          list = result.data;
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
}
