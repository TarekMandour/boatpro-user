import 'package:example/models/date.dart';
import 'package:example/models/time.dart';
import 'package:example/services/reservation_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';
import 'package:stacked/stacked.dart';

class BookYachtViewModel extends BaseViewModel {
  final _commonService = locator<CommonService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _reservationService = locator<ReservationService>();
  final bottomNav = locator<BottomNavBarViewModel>();

  bool validateDescription = false;
  bool validatePeopleNumber = false;

  String description = '';

  String errorMessageDescription = '';

  DateTime? datePickerValue;

  String? peopleNumber;

  List<DateModel> dates = [];
  List<TimeModel> times = [];
  TimeModel? selectedTime;
  DateModel? selectedDate;

  void updateDescription(String val) {
    description = val;
    notifyListeners();
  }

  void updatePeopleNumber(String val) {
    peopleNumber = val;
    notifyListeners();
  }

  // void navigateToConfirmReservationView() {
  //   _navigationService.navigateToConfirmReservationView();
  // }

  void updateDatePicker(DateTime? value) {
    datePickerValue = value;
    notifyListeners();
  }

  Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    initialDate ??= DateTime.now();
    firstDate ??= initialDate;
    lastDate ??= firstDate.add(const Duration(days: 365 * 200));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate == null) return null;

    if (!context.mounted) return selectedDate;

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );

    return selectedTime == null
        ? selectedDate
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
  }

  Future bookYacht(yachtId, bool isUpdate) async {
    if (selectedDate == null) {
      _dialogService.showCustomSnackBar(
          message: translate(AppStrings.pickYourDate),
          variant: SnackbarType.error);
      notifyListeners();
    } else if (peopleNumber == null || (peopleNumber?.isEmpty ?? false)) {
      _dialogService.showCustomSnackBar(
          message: translate(AppStrings.peopleNumber),
          variant: SnackbarType.error);
      notifyListeners();
    } else if (Validators.validateFieldForm(description) != null) {
      validateDescription = true;
      errorMessageDescription = Validators.validateFieldForm(description) ?? '';
      notifyListeners();
    } else {
      showLoading();
      validateDescription = false;
      errorMessageDescription = '';
      notifyListeners();

      try {
        if (isUpdate) {
          await updateYacht(yachtId);
        } else {
          await storeYacht(yachtId);
        }
      } catch (e) {
        // Handle the error
      } finally {
        hideLoading();
      }
    }
  }

  Future storeYacht(yachtId) async {
    final result = await _reservationService.bookYacht(
      // startDay: datePickerValue,
      // endDay: datePickerValue,
      times: selectedTime != null ? [selectedTime!] : [],
      note: description,
      numGuests: peopleNumber,
      yachtId: yachtId,
    );
    result.fold(
      (error) => _dialogService.showCustomSnackBar(
          message: error.message, variant: SnackbarType.error),
      (result) {
        bottomNav.setIndex(2);
        _navigationService.back();
        _navigationService.back();
      },
    );
  }

  Future updateYacht(yachtId) async {
    final result = await _reservationService.updateYacht(
      startDay: datePickerValue,
      endDay: datePickerValue,
      note: description,
      yachtId: yachtId,
    );
    result.fold(
      (error) => _dialogService.showCustomSnackBar(
          message: error.message, variant: SnackbarType.error),
      (result) {
        _navigationService.back();
      },
    );
  }

  Future getYachtDates(String yachtId) async {
    try {
      showLoading();
      final result = await _commonService.getYachtDates(yachtId);
      result.fold(
        (error) => debugPrint('getYachtDates failed: ${error.message}'),
        (result) {
          dates = result.data;
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

  Future getYachtTimes(String yachtId, String date) async {
    try {
      showLoading();
      final result = await _commonService.getYachtTimes(yachtId, date);
      result.fold(
        (error) => debugPrint('getYachtTimes failed: ${error.message}'),
        (result) {
          times = result.data;
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
