import 'dart:io';

import 'package:intl/intl.dart';

import '../ui/index.dart';

class Helper {
  final _navigationService = locator<NavigationService>();

  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static String getFormattedDate(String dateTime) {
    if (dateTime == '') {
      return '';
    }
    var date = DateTime.parse(dateTime);
    return DateFormat('yyyy/MM/dd', 'en').format(date);
  }

  static String getFormattedWithTimeDate(String dateTime) {
    if (dateTime == '') {
      return '';
    }
    var date = DateTime.parse(dateTime);
    return DateFormat('dd, MMM, yyyy - hh:mm a', 'en').format(date);
  }

  static String formatTime(String timeString) {
    // Split the time string into hours, minutes, and seconds
    List<String> timeParts = timeString.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);

    // Determine the AM/PM indicator
    String indicator = (hours >= 12) ? 'PM' : 'AM';

    // Convert the hours to 12-hour format
    hours = hours % 12;
    if (hours == 0) {
      hours = 12;
    }

    // Format the time string with the AM/PM indicator
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $indicator';

    return formattedTime;
  }

  static bool isArabic() {
    var localizationDelegate =
        LocalizedApp.of(StackedService.navigatorKey!.currentContext!).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    if (lang == AppStrings.en) {
      return false;
    } else {
      return true;
    }
  }

  String getFileType(String message) {
    // Define lists of file extensions for images and videos
    List<String> imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp'];
    List<String> videoExtensions = [
      '.mp4',
      '.avi',
      '.mov',
      '.mkv',
      '.wmv',
      '.mp4',
      '.avi',
      '.webm',
      '.mpeg',
      '.3gp',
      '.mpg4'
    ];
    List<String> fileExtensions = [
      '.pdf',
      '.xls',
      '.xlm',
      '.xla',
      '.xlc',
      '.xlt',
      '.xlw',
      '.xlsx',
      '.csv'
    ];

    String lowerCaseFileName = message.toLowerCase();

    // Check if the file name ends with any of the image extensions
    if (imageExtensions.any((ext) => lowerCaseFileName.endsWith(ext))) {
      return 'Image';
    }

    // Check if the file name ends with any of the video extensions
    if (videoExtensions.any((ext) => lowerCaseFileName.endsWith(ext))) {
      return 'Video';
    }
    // Check if the file name ends with any of the file extensions
    if (fileExtensions.any((ext) => lowerCaseFileName.endsWith(ext))) {
      return 'File';
    }

    // If the file doesn't match any of the above types, consider it a generic file
    return message;
  }

  Future<double> getFileSizeInMB(File? file) async {
    int bytes = file?.lengthSync() ?? 0;
    if (bytes <= 0) return 0;
    double sizeInMb = bytes / (1024 * 1024);
    return sizeInMb;
  }

  void navigateToConversationView(
      String id, String providerName, String image) {
    _navigationService.navigateToConversationView(
        id: id, providerName: providerName, image: image);
  }
}

void showLoading() {
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) => CustomLoadWidget(cancelFunc: cancelFunc),
  );
}

void hideLoading() {
  BotToast.closeAllLoading();
}
