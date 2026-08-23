import 'package:example/services/auth_service.dart';
import 'package:example/utils/validators.dart';

import '../../index.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();

  bool validatePassword = false;
  String password = '';
  String errorMessagePassword = '';

  bool validateConfirmPassword = false;
  String confirmPassword = '';
  String errorMessageConfirmPassword = '';

  void updatePassword(String val) {
    password = val;
    notifyListeners();
  }

  void updateConfirmPassword(String val) {
    confirmPassword = val;
    notifyListeners();
  }

  Future changePassword(phone) async {
    if (Validators.validatePassword(password) != null) {
      validatePassword = true;
      errorMessagePassword = Validators.validatePassword(password) ?? '';
      notifyListeners();
    } else if (Validators.validatePassword(confirmPassword) != null) {
      validateConfirmPassword = true;
      errorMessageConfirmPassword =
          Validators.validatePassword(confirmPassword) ?? '';
      notifyListeners();
    } else {
      showLoading();

      validatePassword = false;
      validateConfirmPassword = false;
      errorMessagePassword = '';
      errorMessageConfirmPassword = '';
      notifyListeners();

      try {
        final result = await _authService.updatePassword(
          password: password,
          passwordConfirmation: confirmPassword,
          phone: "$phone",
        );
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              message: error.message, variant: SnackbarType.error),
          (result) {
            _dialogService.showCustomSnackBar(
                message: result.message, variant: SnackbarType.success);
            _navigationService.replaceWithLoginView();
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
