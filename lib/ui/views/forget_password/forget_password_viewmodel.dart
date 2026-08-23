import 'package:example/app/app.snackbar.dart';
import 'package:example/services/auth_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();

  // bool validatePhone = false;
  bool validateEmail = false;
  bool validatePassword = false;
  bool isRememberData = false;

  // String phone = '';
  // String errorMessagePhone = '';
  String email = '';
  String errorMessageEmail = '';

  void updateEmail(String val) {
    email = val;
    notifyListeners();
  }

  // void updatePhone(String val) {
  //   phone = val;
  //   notifyListeners();
  // }

  Future sendOtp() async {

      showLoading();
      validateEmail = false;
      errorMessageEmail = '';
      notifyListeners();
      try {
        final result = await _authService.checkEmail(email: "$email", exist: 1);
        result.fold(
          (error) =>
              _dialogService.showCustomSnackBar(message: error.message, variant: SnackbarType.error),
          (result) {
            _navigationService.navigateToOtpView(isChangePassword: true, phone: email, email: email);
          },
        );
      } catch (e) {
        // Handle the error
      } finally {
        hideLoading();
      }

  }
}
