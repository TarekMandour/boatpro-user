import 'package:example/ui/index.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    print(viewModel.preferencesService.userData?.toJson());
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(screenHeightFraction(context, dividedBy: 4)),
        child: AppBar(
          automaticallyImplyLeading: false,
          // hides leading widget
          flexibleSpace: Assets.svg.bg.svg(fit: BoxFit.cover),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            children: [
              CustomText(
                  title: translate(AppStrings.profile),
                  textColor: kcWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.font18),
              verticalSpaceTiny,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: kcWhiteColor,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: kcSecondaryColor,
                      backgroundImage: NetworkImage(viewModel.preferencesService
                                  .userData?.image?.isEmpty ??
                              false
                          ? AppStrings.placeHolderImages
                          : viewModel.preferencesService.userData?.image ??
                              AppStrings.placeHolderImages),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: IconButton(
                      onPressed: viewModel.pickImage,
                      icon: CircleAvatar(
                        backgroundColor: kcWhiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(1.2),
                          child: CircleAvatar(
                            backgroundColor: kcSecondaryColor,
                            child: Assets.svg.camera.svg(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          centerTitle: true,
          toolbarHeight: screenHeightFraction(context, dividedBy: 5),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Column(
                children: [
                  CustomText(
                      title: viewModel.preferencesService.userData?.name ?? '',
                      textColor: kcTextBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.font18),
                  CustomText(title: translate(AppStrings.client)),
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: translate(AppStrings.profile),
                    fontWeight: FontWeight.bold,
                  ),
                  // verticalSpaceSmall,
                  // CustomTile(
                  //   leadChild: Assets.svg.order.svg(),
                  //   titleChild: CustomText(
                  //     title: translate(AppStrings.myOrders),
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   trailingChild: Helper.isArabic() ? Icon(Icons.keyboard_arrow_left, color: kcSecondaryColor):Icon(Icons.keyboard_arrow_right, color: kcSecondaryColor),
                  // ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.order.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.myReviews),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.navigateToReviewsView,
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.heart.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.savedYachts),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.navigateToSavedView,
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.notification.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.notifications),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.navigateToNotificationsView,
                  ),
                ],
              ),
              verticalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: translate(AppStrings.accountPreferences),
                    fontWeight: FontWeight.bold,
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.setting.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.settings),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.navigateToSettingsView,
                  ),
                ],
              ),
              verticalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: translate(AppStrings.support),
                    fontWeight: FontWeight.bold,
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.privacy.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.privacy),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: () => viewModel.navigateToPagesView(
                        AppStrings.privacy,
                        viewModel.pages.first.content ?? ''),
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.faq.svg(),
                    titleChild: CustomText(
                      title: translate('faq'),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.navigateToFaqView,
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.terms.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.terms),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: () => viewModel.navigateToPagesView(
                        AppStrings.terms, viewModel.pages[1].content ?? ''),
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.pages.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.aboutus),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: () => viewModel.navigateToPagesView(
                        AppStrings.aboutus, viewModel.pages[5].content ?? ''),
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.call.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.contactus),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.navigateToContactusView,
                  ),
                  verticalSpaceSmall,
                  CustomTile(
                    leadChild: Assets.svg.logout.svg(),
                    titleChild: CustomText(
                      title: translate(AppStrings.logout),
                      fontWeight: FontWeight.bold,
                    ),
                    trailingChild: Helper.isArabic()
                        ? Icon(Icons.keyboard_arrow_left,
                            color: kcSecondaryColor)
                        : Icon(Icons.keyboard_arrow_right,
                            color: kcSecondaryColor),
                    onTap: viewModel.logout,
                  ),
                ],
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getPages();
  }
}
