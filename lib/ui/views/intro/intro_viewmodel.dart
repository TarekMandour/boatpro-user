import 'package:example/ui/index.dart';

class IntroViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int currentIndex = 0;
  int pages = 3;
  late PageController controller;
  Duration customDuration = const Duration(milliseconds: 500);
  String title = '';
  String description = '';

  Future init() async {
    notifyListeners();
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeContent(int index) {
    if (index == 0) {
      title = translate(AppStrings.introTitle1);
      description = translate(AppStrings.introDesc1);
    } else if (index == 1) {
      title = translate(AppStrings.introTitle2);
      description = translate(AppStrings.introDesc2);
    } else if (index == 2) {
      title = translate(AppStrings.introTitle3);
      description = translate(AppStrings.introDesc3);
    }
  }

  void nextPage() {
    controller.nextPage(duration: customDuration, curve: Curves.ease);
  }

  void skipButton() {
    controller.animateToPage(pages,
        duration: customDuration, curve: Curves.ease);
  }

  void loginBtn() {
    _navigationService.replaceWithLoginView();
  }

  void registerBtn() {
    _navigationService.replaceWithRegisterView();
  }
}
