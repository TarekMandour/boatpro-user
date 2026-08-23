import 'package:example/models/user.dart';
import 'package:example/services/auth_service.dart';
import 'package:example/services/fcm_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/ui/views/bottom_nav_bar/bottom_nav_bar_viewmodel.dart';
import 'package:example/ui/widgets/custom_web_view.dart';
import 'package:example/utils/validators.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _prefService = locator<PreferencesService>();
  final bottomNav = locator<BottomNavBarViewModel>();

  bool validateEmail = false;
  bool validatePhone = false;
  bool validatePassword = false;
  bool isRememberData = false;

  String phone = '';
  String password = '';

  String email = '';
  String errorMessageEmail = '';

  String errorMessagePhone = '';
  String errorMessagePassword = '';

  UserData? userSocial;

  void registerBtn() {
    _navigationService.navigateToRegisterView();
  }

  void replaceWithBottomNavBarView() {
    _navigationService.replaceWithBottomNavBarView();
  }

  void navigateToForgetPasswordView() {
    _navigationService.navigateToForgetPasswordView();
  }

  void updateRememeber() {
    isRememberData = !isRememberData;
    notifyListeners();
  }

  void updatePhone(String val) {
    phone = val;
    notifyListeners();
  }

  void updateEmail(String val) {
    email = val;
    notifyListeners();
  }

  void updatePassword(String val) {
    password = val;
    notifyListeners();
  }

  Future loginBySocial(String socialType) async {
    final token = await _navigationService
        .navigateToView(WebViewCustom(url: '${Url.mainUrl}/$socialType'));
    if (token != null) {
      _prefService.setCacheToken(token);
      try {
        await getProfile();
        if (userSocial != null) {
          _prefService.setCacheUserData(
              user: userSocial!, isUpdateToken: false);
          bottomNav.setIndex(0);
          _navigationService.replaceWithBottomNavBarView();
        }
      } catch (e) {
        print('loginBySocial  ${e}');
      }
    }
  }

  Future<String?> getTokenFCM() async {
    final _instance = FirebaseMessaging.instance;
    return _instance.getToken();
  }

  Future loginBtn() async {
    if (Validators.validateEmail(email) != null) {
      validateEmail = true;
      errorMessageEmail = Validators.validateEmail(email) ?? '';
      notifyListeners();
    } else if (Validators.validateFieldForm(password) != null) {
      validatePassword = true;
      errorMessagePassword = Validators.validateFieldForm(password) ?? '';
      notifyListeners();
    } else {
      showLoading();

      validateEmail = false;
      validatePassword = false;
      errorMessageEmail = '';
      errorMessagePassword = '';
      notifyListeners();

      try {
        final result = await _authService.login(
          email: "$email",
          password: password,
          fcmToken: await getTokenFCM() ?? '',
        );
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              message: error.message, variant: SnackbarType.error),
          (result) {
            _prefService.setCacheUserData(
                user: result.data, isUpdateToken: true);
            bottomNav.setIndex(0);
            _navigationService.replaceWithBottomNavBarView();
          },
        );
      } catch (e) {
        // Handle the error
        print(e);
      } finally {
        hideLoading();
      }
    }
  }

  Future<void> getProfile() async {
    try {
      final result = await _authService.getProfile();
      result.fold(
        (error) {
          debugPrint('getProfile failed: ${error.message}');
          return null;
        },
        (result) {
          userSocial = result.data;
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    }
  }
}
