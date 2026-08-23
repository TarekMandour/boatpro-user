import 'package:example/ui/index.dart';
import 'package:example/ui/views/chats/chats_view.dart';
import 'package:example/ui/views/home/home_view.dart';
import 'package:example/ui/views/profile/profile_view.dart';
import 'package:example/ui/views/reservations/reservations_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends BaseViewModel {
  // final prefService = locator<PreferencesService>();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ChatsView();
      case 2:
        return const ReservationsView();
      case 3:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  Future init() async {}
}
