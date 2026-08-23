import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';

class ContactusViewModel extends BaseViewModel {
  final _commonService = locator<CommonService>();
  final _prefService = locator<PreferencesService>();
  final _dialogService = locator<SnackbarService>();

  bool validatePhone = false;
  bool validateEmail = false;
  bool validateDescription = false;

  String name = '';
  String phone = '';
  String email = '';
  String description = '';

  String errorMessagePhone = '';
  String errorMessageEmail = '';
  String errorMessageDescription = '';

  void updatePhone(String val) {
    phone = val;
    notifyListeners();
  }

  void updateDescription(String val) {
    description = val;
    notifyListeners();
  }

  void updateEmail(String val) {
    email = val;
    notifyListeners();
  }

  Future sendBtn() async {
    if (Validators.validatePhone(phone) != null) {
      validatePhone = true;
      errorMessagePhone = Validators.validatePhone(phone) ?? '';
      notifyListeners();
    } else if (Validators.validateEmail(email) != null) {
      validateEmail = true;
      errorMessageEmail = Validators.validateEmail(email) ?? '';
      notifyListeners();
    } else if (Validators.validateFieldForm(description) != null) {
      validateDescription = true;
      errorMessageDescription = Validators.validateFieldForm(description) ?? '';
      notifyListeners();
    } else {
      showLoading();

      validatePhone = false;
      validateEmail = false;
      validateDescription = false;
      errorMessagePhone = '';
      errorMessageEmail = '';
      errorMessageDescription = '';
      notifyListeners();

      try {
        final result = await _commonService.sendContactUs(
          phone: "966$phone",
          email: email,
          message: description,
          firstName: _prefService.userData?.name?.split(' ').first ?? '',
          lastName: _prefService.userData?.name?.split(' ').last ?? '',
        );
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              message: error.message, variant: SnackbarType.error),
          (result) {
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
