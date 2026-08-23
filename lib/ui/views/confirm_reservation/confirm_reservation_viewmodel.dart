import 'package:example/models/setting.dart';
import 'package:example/services/reservation_service.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

class ConfirmReservationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _commonService = locator<CommonService>();
  final _reservationService = locator<ReservationService>();
  final _dialogService = locator<SnackbarService>();

  SettingModel? settingModel;

  num total = 0;
  int paymentMethod = 0;

  void init(String reservationId) {}

  void replaceWithReservationDetailsView(String yachtId) {
    _navigationService.replaceWithReservationDetailsView(reReserve: false, yachtId: yachtId);
  }

  void changePaymentMethod(int value) {
    paymentMethod = value;
    notifyListeners();
  }

  num calculateTotal(num price) {
    return price + num.parse(settingModel?.vat ?? '0') + num.parse(settingModel?.serviceFee ?? '0');
  }

  Future getSettings() async {
    try {
      showLoading();
      final result = await _commonService.getSettings();
      result.fold(
        (error) => debugPrint('getSettings failed: ${error.message}'),
        (result) {
          settingModel = result.data.first;
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

  Future confirmPay(String yachtId, num price) async {
    try {
      showLoading();
      final result = await _reservationService.confirmPay(
        yachtId: yachtId,
        paymentMethod: paymentMethod == 0 ? 'cash' : 'credit',
        subTotal: price.toString(),
        vat: settingModel?.vat ?? '0',
        serviceFee: settingModel?.serviceFee ?? '0',
        total: calculateTotal(price).toString(),
      );
      result.fold(
        (error) => debugPrint('confirmPay failed: ${error.message}'),
        (result) async {
          if (result.data.paymentLink == null) _navigationService.back();
          if (result.data.paymentLink != null) {
            final r = await _navigationService.navigateToPayView(url: result.data.paymentLink ?? '');
            if (r == true) {
              _navigationService.back();
            } else {
              _dialogService.showCustomSnackBar(message: AppStrings.failedPay, variant: SnackbarType.error);
            }
          }
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
