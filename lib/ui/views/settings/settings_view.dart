import 'package:example/ui/index.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: const CustomAppBar(titleText: AppStrings.settings),
      body: Container(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall,
            CustomTile(
              leadChild: Assets.svg.info.svg(),
              titleChild: CustomText(
                title: translate(AppStrings.accountInfo),
                fontWeight: FontWeight.bold,
              ),
              trailingChild: Helper.isArabic()
                  ? Icon(Icons.keyboard_arrow_left, color: kcSecondaryColor)
                  : Icon(Icons.keyboard_arrow_right, color: kcSecondaryColor),
              onTap: viewModel.navigateToEditAccountView,
            ),
            verticalSpaceSmall,
            CustomTile(
                leadChild: Assets.svg.notification.svg(),
                titleChild: CustomText(
                  title: translate(AppStrings.notifications),
                  fontWeight: FontWeight.bold,
                ),
                trailingChild: FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  toggleSize: 22.0,
                  value: viewModel.activeNotication,
                  borderRadius: 30.0,
                  activeColor: kcSecondaryColor,
                  // padding: 8.0,
                  showOnOff: false,
                  onToggle: (val) {
                    viewModel.updateNotification(val);
                  },
                )),
            verticalSpaceSmall,
            CustomTile(
              leadChild: Assets.svg.language.svg(),
              titleChild: CustomText(
                title: translate(AppStrings.language),
                fontWeight: FontWeight.bold,
              ),
              onTap: viewModel.showBsLanguage,
              trailingChild: Helper.isArabic()
                  ? Icon(Icons.keyboard_arrow_left, color: kcSecondaryColor)
                  : Icon(Icons.keyboard_arrow_right, color: kcSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();
}
