import 'package:example/ui/index.dart';
import 'package:example/ui/views/bottom_nav_bar/bottom_nav_bar_viewmodel.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final bottomNav = locator<BottomNavBarViewModel>();

  bool activeNotication = true;

  void updateNotification(value) {
    activeNotication = value;
    notifyListeners();
  }

  void navigateToEditAccountView() {
    _navigationService.navigateToEditAccountView();
  }

  void showBsLanguage() async {
    await _bottomSheetService
        .showCustomSheet(
      variant: BottomSheetType.language,
      title: translate(AppStrings.language),
      mainButtonTitle: translate(AppStrings.apply),
    )
        .then((value) {
      notifyListeners();
      bottomNav.notifyListeners();
    });
  }
}
