import 'package:example/models/page.dart';
import 'package:example/services/auth_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/utils/validators.dart';

class CreateAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _prefService = locator<PreferencesService>();
  final _commonService = locator<CommonService>();

  List<PageModel> pages = [];

  // bool validateEmail = false;
  bool validateUserName = false;
  bool validatePassword = false;
  // bool validatePhone = false;

  // String email = '';
  String name = '';
  String password = '';
  String photo = '';
  // String phone = '';

  String errorMessageEmail = '';
  String errorMessageName = '';
  String errorMessagePassword = '';
  // String errorMessagePhone = '';

  // void updateEmail(String val) {
  //   email = val;
  //   notifyListeners();
  // }

  void updateName(String val) {
    name = val;
    notifyListeners();
  }

  void updatePassword(String val) {
    password = val;
    notifyListeners();
  }

  // void updatePhone(String val) {
  //   phone = val;
  //   notifyListeners();
  // }

  void navToTerm() {
    _navigationService.navigateToPagesView(title: AppStrings.terms, body: pages[3].content ?? '');
  }

  Future getPages() async {
    try {
      showLoading();
      final result = await _commonService.getPages();
      result.fold(
        (error) => debugPrint('getPages failed: ${error.message}'),
        (result) {
          pages = result.data;
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

  Future registerBtn(phone, email) async {
    if (Validators.validateFieldForm(name) != null) {
      validateUserName = true;
      errorMessageName = Validators.validateFieldForm(name) ?? '';
      notifyListeners();
    } else if (Validators.validatePassword(password) != null) {
      validatePassword = true;
      errorMessagePassword = Validators.validatePassword(password) ?? '';
      notifyListeners();
    }
    // else if (Validators.validateEmail(email) != null) {
    //   validateEmail = true;
    //   errorMessageEmail = Validators.validateEmail(email) ?? '';
    //   notifyListeners();
    // }
    // else if (Validators.validatePhone(phone) != null) {
    //   validatePhone = true;
    //   errorMessagePhone = Validators.validatePhone(phone) ?? '';
    //   notifyListeners();
    // }
    else {
      showLoading();
      // validateEmail = false;
      validateUserName = false;
      validatePassword = false;
      // validatePhone = false;
      // errorMessageEmail = '';
      errorMessageName = '';
      errorMessagePassword = '';
      // errorMessagePhone = '';
      notifyListeners();
      try {
        final result = await _authService.register(
          phone: "966$phone",
          email: email,
          name: name,
          password: password,
          photo: photo,
          role: 'user',
        );
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              message: error.data?.phone?.first ?? error.message, variant: SnackbarType.error),
          (result) {
            _navigationService.replaceWithCongratulationsView();
            _prefService.setCacheUserData(user: result.data, isUpdateToken: true);
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
