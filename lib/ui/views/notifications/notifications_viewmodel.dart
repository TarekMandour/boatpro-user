import 'package:example/models/notifications.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

class NotificationsViewModel extends BaseViewModel {
  final _commonService = locator<CommonService>();

  List<NotificationModel> data = [];

  Future getNotification() async {
    try {
      showLoading();
      final result = await _commonService.getNotification();
      result.fold(
        (error) => debugPrint('getNotification failed: ${error.message}'),
        (result) {
          data = result.data;
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
