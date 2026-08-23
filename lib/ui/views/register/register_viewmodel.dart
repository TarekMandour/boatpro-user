import 'package:example/services/auth_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _prefService = locator<PreferencesService>();

  bool validateEmail = false;
  bool validatePhone = false;

  String email = '';
  String errorMessageEmail = '';

  String phone = '';
  String errorMessagePhone = '';

  void updatePhone(String val) {
    phone = val;
    notifyListeners();
  }

  void loginBtn() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void updateEmail(String val) {
    email = val;
    notifyListeners();
  }

  Future sendOtp() async {
      showLoading();
      validateEmail = false;
      errorMessageEmail = '';
      notifyListeners();
      try {
        final result = await _authService.checkEmail(
          email: "$email",
          exist: 0,
        );
        result.fold(
          (error) =>
              _dialogService.showCustomSnackBar(message: error.data?.phone?.first ?? error.message, variant: SnackbarType.error),
          (result) {
            _navigationService.navigateToOtpView(isChangePassword: false, phone: email, email: phone);
          },
        );
      } catch (e) {
        // Handle the error
      } finally {
        hideLoading();
      }

  }
}
