import 'package:example/app/app.snackbar.dart';
import 'package:example/services/auth_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';
import 'package:stacked/stacked.dart';

class EditAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final preferencesService = locator<PreferencesService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();

  bool validateEmail = false;
  bool validateName = false;
  bool validateFirstName = false;
  bool validateLastName = false;
  bool validatePassword = false;
  bool validateNational = false;

  TextEditingController editingControllerEmail = TextEditingController();
  TextEditingController editingControllerName = TextEditingController();
  TextEditingController editingControllerFirstName = TextEditingController();
  TextEditingController editingControllerLastName = TextEditingController();
  TextEditingController editingControllerNational = TextEditingController();

  String email = '';
  String name = '';
  String firstName = '';
  String lastName = '';
  String password = '';
  String national = '';
  DateTime? datePickerValue;

  String errorMessageEmail = '';
  String errorMessageName = '';
  String errorMessageFirstName = '';
  String errorMessageLastName = '';
  String errorMessagePassword = '';
  String errorMessageNational = '';

  void init() {
    editingControllerEmail.text = preferencesService.userData?.email ?? '';
    email = preferencesService.userData?.email ?? '';
    editingControllerName.text = preferencesService.userData?.name ?? '';
    name = preferencesService.userData?.name ?? '';
    notifyListeners();
  }

  void updateEmail(String val) {
    email = val;
    notifyListeners();
  }

  void updateName(String val) {
    name = val;
    notifyListeners();
  }

  void updateFirstName(String val) {
    firstName = val;
    notifyListeners();
  }

  void updateLastName(String val) {
    lastName = val;
    notifyListeners();
  }

  void updateNational(String val) {
    national = val;
    notifyListeners();
  }

  void updatePassword(String val) {
    password = val;
    notifyListeners();
  }

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

  Future saveBtn() async {
    // if (Validators.validateEmail(email) != null) {
    //   validateEmail = true;
    //   errorMessageEmail = Validators.validateEmail(email) ?? '';
    //   notifyListeners();
    // } else
    if (Validators.validateFieldForm(name) != null) {
      validateName = true;
      errorMessageName = Validators.validateFieldForm(name) ?? '';
      notifyListeners();
    } else {
      showLoading();

      // validateEmail = false;
      validateName = false;
      validatePassword = false;

      // errorMessageEmail = '';
      errorMessageName = '';
      errorMessagePassword = '';
      notifyListeners();

      try {
        final result = await _authService.updateProfile(
          email: email,
          name: name,
          password: password,
        );
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              message: error.message, variant: SnackbarType.error),
          (result) {
            preferencesService.setCacheUserData(
                user: result.data, isUpdateToken: false);
            _dialogService.showCustomSnackBar(
                message: result.message, variant: SnackbarType.success);
          },
        );
      } catch (e) {
        // Handle the error
      } finally {
        hideLoading();
      }
    }
  }
}
