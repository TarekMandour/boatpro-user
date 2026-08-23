import 'package:example/services/auth_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';
import 'package:stacked/stacked.dart';

class OtpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _prefService = locator<PreferencesService>();

  bool validatePhone = false;

  String verifyCode = '';
  // Validate
  String errorMessage = '';

  // Time
  Timer? timer;
  int countDown = 1 * 60;
  bool screenReset = true;

  void init() {
    notifyListeners();
    startCountDown();
  }

  void resendBtn() {
    countDown = 1 * 60;
    notifyListeners();
    resent();
  }

  void resent() {
    sendVerifyPhoneNumber();
    startCountDown();
  }

  void startCountDown() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countDown == 0) {
          timer.cancel();
          screenReset = false;
          notifyListeners();
        } else {
          countDown--;
          screenReset = true;
          notifyListeners();
        }
      },
    );
  }

  void updateVerifyCode(String val) {
    verifyCode = val;
    notifyListeners();
  }

  Future sendVerifyPhoneNumber() async {
    showLoading();
    try {} catch (e) {
      // Handle the error
    } finally {
      hideLoading();
    }
  }

  Future sendOtp(phone,  email, isChangePassword) async {
    if (Validators.validateConfCodeForm(verifyCode) != null) {
      validatePhone = true;
      errorMessage = Validators.validateConfCodeForm(verifyCode) ?? '';
      notifyListeners();
    } else {
      showLoading();
      validatePhone = false;
      errorMessage = '';
      notifyListeners();
      try {
        final result = await _authService.checkVerification(
            phone: "$phone", code: verifyCode);
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              message: error.message, variant: SnackbarType.error),
          (result) {
            if (isChangePassword) {
              _navigationService.replaceWithChangePasswordView(phone: phone);
            } else {
              _navigationService.replaceWithCreateAccountView(phone: phone, email: email);
            }
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
