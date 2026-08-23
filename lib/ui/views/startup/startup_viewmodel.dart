import 'package:example/models/user.dart';
import 'package:example/ui/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _prefService = locator<PreferencesService>();

  bool _showIntroScreen = false;
  bool _userCache = false;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await _checkFirstTime();
    await _checkUserCache();
    // await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithIntroView();
    if (_showIntroScreen) {
      _navigationService.replaceWithIntroView();
    } else {
      if (_userCache) {
        _navigationService.replaceWithBottomNavBarView();
      } else {
        _navigationService.replaceWithLoginView();
      }
    }
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('showIntro') ?? true;
    _showIntroScreen = showIntro;
    notifyListeners();
    if (_showIntroScreen) {
      await prefs.setBool('showIntro', false);
    }
  }

  Future<void> _checkUserCache() async {
    UserData? userData = await _prefService.getCachedUserData();
    if (userData?.id != null) {
      _prefService.userData = userData;
      _userCache = true;
      notifyListeners();
    } else {
      _userCache = false;
      notifyListeners();
    }
  }
}
