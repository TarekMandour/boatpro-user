import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'congratulations_viewmodel.dart';

class CongratulationsView extends StackedView<CongratulationsViewModel> {
  const CongratulationsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CongratulationsViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [kcPrimaryColor, kcSecondaryColor],
        ),
        shape: RoundedRectangleBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(bottom: 0, child: Assets.svg.bottom.svg()),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.successAccount.svg(),
                      verticalSpaceSmall,
                      CustomText(
                        title: translate(AppStrings.congratulation),
                        fontSize: AppFontSize.font32,
                        fontWeight: AppFontWeight.bold,
                        textColor: kcWhiteColor,
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                      ),
                      verticalSpaceSmall,
                      CustomText(
                        title: translate(AppStrings.createAccountSuccess),
                        fontSize: AppFontSize.font22,
                        textColor: kcWhiteColor,
                        fontWeight: AppFontWeight.bold,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                      ),
                      verticalSpaceSmall,
                      CustomText(
                        title: translate(AppStrings.ksLoremDescription),
                        maxLines: 5,
                        fontSize: AppFontSize.font14,
                        textColor: kcWhiteColor,
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: translate(AppStrings.exploreYachts),
                        isSecondary: true,
                        colorButton: kcWhiteColor,
                        onTap: viewModel.replaceWithBottomNavBarView,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CongratulationsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CongratulationsViewModel();
}
