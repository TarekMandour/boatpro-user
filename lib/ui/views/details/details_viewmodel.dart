import 'package:example/ui/index.dart';

class DetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _favouriteService = locator<FavouriteService>();

  void navigateToBookYachtView(String yachtId) {
    _navigationService.navigateToBookYachtView(yachtId: yachtId);
  }

  Future addFavourite(YachtModel yacht) async {
    try {
      showLoading();
      final result =
          await _favouriteService.addFavourite(yachtId: yacht.id.toString());
      result.fold(
        (error) => debugPrint('addFavourite failed: ${error.message}'),
        (result) {
          yacht.isFav = !(yacht.isFav ?? false);
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
}
