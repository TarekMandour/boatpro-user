import 'package:example/ui/index.dart';
import 'package:example/ui/views/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:stacked/stacked.dart';

class CongratulationsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void replaceWithBottomNavBarView() {
    _navigationService.clearStackAndShowView(BottomNavBarView());
  }
}
