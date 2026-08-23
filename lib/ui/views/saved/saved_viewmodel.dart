import 'package:example/ui/index.dart';

class SavedViewModel extends BaseViewModel {
  final _favouriteService = locator<FavouriteService>();

  List<YachtModel> yachts = [];

  Future getFavouritesYacht() async {
    try {
      showLoading();
      final result = await _favouriteService.getFavourites();
      result.fold(
        (error) => debugPrint('getFavourites failed: ${error.message}'),
        (result) {
          yachts = result.data;
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

  Future addFavourite(YachtModel yacht) async {
    try {
      showLoading();
      final result =
          await _favouriteService.addFavourite(yachtId: yacht.id.toString());
      result.fold(
        (error) => debugPrint('addFavourite failed: ${error.message}'),
        (result) {
          yachts.remove(yacht);
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
