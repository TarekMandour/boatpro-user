import 'package:example/models/yacht.dart';
import 'package:example/services/common_service.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

import '../../../services/favourite_service.dart';

class TopYachtsViewModel extends BaseViewModel {
  final _commonService = locator<CommonService>();
  final _favouriteService = locator<FavouriteService>();

  List<YachtModel> yachts = [];

  Future getYachts({String? text}) async {
    try {
      showLoading();
      setBusy(true);

      final result = await _commonService.getYachts(sortBy: 'top', name: text);
      result.fold(
        (error) => debugPrint('getYachts failed: ${error.message}'),
        (result) {
          yachts = result.data;
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      setBusy(false);
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
