import 'package:example/models/conversation.dart';
import 'package:example/services/chat_service.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

class ConversationViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _chatService = locator<ChatService>();
  final prefService = locator<PreferencesService>();
  final _dialogService = locator<SnackbarService>();

  List<ConversationModel> data = [];
  final TextEditingController controller = TextEditingController();

  Future getThreadChat(String id) async {
    try {
      showLoading();
      final result = await _chatService.getThreadChat(id);
      result.fold(
        (error) => debugPrint('getThreadChat failed: ${error.message}'),
        (result) {
          data = result.data.reversed.toList();
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

  Future<void> getMediaPicker() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.mediaPicker,
      title: translate(AppStrings.selectMediaPicker),
      mainButtonTitle: translate(AppStrings.document),
      secondaryButtonTitle: translate(AppStrings.photos),
      additionalButtonTitle: translate(AppStrings.videos),
    );
    if (result?.data != null) {
      print('pick ${result?.data}');
    }
  }

  Future sendMessage(String message, int reciverId) async {
    if (message.isEmpty || message.trim().isEmpty) {
      return;
    } else {
      try {
        showLoading();
        final result = await _chatService.sendMessage(
          message: message,
          reciverId: reciverId.toString(),
        );
        result.fold(
          (error) => _dialogService.showCustomSnackBar(
              variant: SnackbarType.error, message: error.message),
          (result) {
            controller.clear();
            getThreadChat(reciverId.toString());
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
  }
}
