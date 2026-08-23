import '../ui/index.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: kcRedColor,
      textColor: Colors.white,
      mainButtonTextColor: kcDarkGreyColor,
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      margin: const EdgeInsets.all(0),
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      mainButtonTextColor: kcDarkGreyColor,
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      margin: const EdgeInsets.all(0),
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.info,
    config: SnackbarConfig(
      backgroundColor: kcMediumGrey,
      textColor: Colors.white,
      mainButtonTextColor: kcDarkGreyColor,
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      margin: const EdgeInsets.all(0),
    ),
  );
}

enum SnackbarType { success, error, info }
