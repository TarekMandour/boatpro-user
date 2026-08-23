import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'forget_password_viewmodel.dart';

class ForgetPasswordView extends StackedView<ForgetPasswordViewModel> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetPasswordViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => Helper.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: const CustomAppBar(titleText: AppStrings.forgetPassword, backButton: true),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(bottom: 0, child: Assets.svg.bottom.svg()),
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      verticalSpaceMedium,
                      CustomText(
                          title: translate(AppStrings.changePassword),
                          textColor: kcTextBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.font24),
                      verticalSpaceSmall,
                      CustomText(title: translate(AppStrings.welcomeBoard)),
                      verticalSpaceMedium,
                      // Phone Number
                      CustomText(
                        title: translate(AppStrings.email),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      ),
                      // CustomFieldInput(
                      //   leading: Container(
                      //     padding: const EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //       color: kcSecondaryColor.withOpacity(0.15),
                      //       borderRadius: const BorderRadius.only(
                      //         topLeft: Radius.circular(100),
                      //         bottomLeft: Radius.circular(100),
                      //       ),
                      //     ),
                      //     child: Wrap(
                      //       alignment: WrapAlignment.center,
                      //       crossAxisAlignment: WrapCrossAlignment.center,
                      //       children: [
                      //         Assets.svg.saudiArabia.svg(),
                      //         horizontalSpaceTiny,
                      //         const CustomText(title: '+966', fontSize: AppFontSize.font14),
                      //       ],
                      //     ),
                      //   ),
                      //   hintText: 'xxx-xxxx-xxx',
                      //   onChange: (value) => viewModel.updatePhone(value),
                      //   isErrorValid: viewModel.validatePhone,
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                      // if (viewModel.errorMessagePhone.isNotEmpty)
                      //   Column(
                      //     children: [
                      //       verticalSpaceTiny,
                      //       Text(viewModel.errorMessagePhone,
                      //           style: const TextStyle(fontSize: AppFontSize.font12, color: kcRedColor)),
                      //     ],
                      //   ),
                      CustomFieldInput(
                        hintText: 'Example@mail.com',
                        onChange: (value) => viewModel.updateEmail(value),
                        isErrorValid: viewModel.validateEmail,
                      ),
                      if (viewModel.errorMessageEmail.isNotEmpty)
                        Column(
                          children: [
                            verticalSpaceTiny,
                            Text(viewModel.errorMessageEmail,
                                style: const TextStyle(
                                    fontSize: AppFontSize.font12,
                                    color: kcRedColor)),
                          ],
                        ),

                      if (viewModel.errorMessageEmail.isNotEmpty)
                        Column(
                          children: [
                            verticalSpaceTiny,
                            Text(viewModel.errorMessageEmail, style: const TextStyle(fontSize: AppFontSize.font12, color: kcRedColor)),
                          ],
                        ),


                      verticalSpaceMassive,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: translate(AppStrings.sendOtp),
                              onTap: viewModel.sendOtp,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ForgetPasswordViewModel viewModelBuilder(BuildContext context) => ForgetPasswordViewModel();
}
