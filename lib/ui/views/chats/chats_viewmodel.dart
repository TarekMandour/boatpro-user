import 'package:example/models/user_model.dart';
import 'package:example/services/chat_service.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

class ChatsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _chatService = locator<ChatService>();

  List<UserModel> data = [];

  Future getChats() async {
    try {
      showLoading();
      final result = await _chatService.getChats();
      result.fold(
        (error) => debugPrint('getChats failed: ${error.message}'),
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
