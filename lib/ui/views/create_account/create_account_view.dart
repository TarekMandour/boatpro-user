import 'package:example/ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'create_account_viewmodel.dart';

class CreateAccountView extends StackedView<CreateAccountViewModel> {
  final String phone;
  final String email;

  const CreateAccountView({Key? key, required this.phone, required this.email}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateAccountViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => Helper.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: const CustomAppBar(
          titleText: AppStrings.accountInformation,
          backButton: true,
        ),
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
                          title: translate(AppStrings.accountInformation),
                          textColor: kcTextBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.font24),
                      verticalSpaceSmall,
                      CustomText(title: translate(AppStrings.welcomeBoard)),

                      verticalSpaceMedium,

                      // Email Address
                      CustomText(
                        title: translate(AppStrings.email),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      ),
                      CustomFieldInput(
                        hintText: phone,
                        // onChange: (value) => viewModel.updateEmail(value),
                        // isErrorValid: viewModel.validateEmail,
                        isEnabled: false,
                      ),
                      if (viewModel.errorMessageEmail.isNotEmpty)
                        Column(
                          children: [
                            verticalSpaceTiny,
                            Text(viewModel.errorMessageEmail,
                                style: const TextStyle(fontSize: AppFontSize.font12, color: kcRedColor)),
                          ],
                        ),
                      verticalSpaceSmall,
                      // Phone Number
                      CustomText(
                        title: translate(AppStrings.phoneNumber),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      ),
                      CustomFieldInput(
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kcSecondaryColor.withOpacity(0.15),
                            borderRadius: Helper.isArabic()
                                ? BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100))
                                : BorderRadius.only(topLeft: Radius.circular(100), bottomLeft: Radius.circular(100)),
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Assets.svg.saudiArabia.svg(),
                              horizontalSpaceTiny,
                              const CustomText(title: '+966', fontSize: AppFontSize.font14),
                            ],
                          ),
                        ),
                        hintText: email,
                        // onChange: (value) => viewModel.updatePhone(value),
                        // isErrorValid: viewModel.validatePhone,
                        isEnabled: false,
                      ),
                      // if (viewModel.errorMessagePhone.isNotEmpty)
                      //   Column(
                      //     children: [
                      //       verticalSpaceTiny,
                      //       Text(viewModel.errorMessagePhone,
                      //           style: const TextStyle(fontSize: AppFontSize.font12, color: kcRedColor)),
                      //     ],
                      //   ),
                      verticalSpaceSmall,
                      CustomText(
                        title: translate(AppStrings.username),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      ),
                      CustomFieldInput(
                        hintText: translate(AppStrings.username),
                        onChange: (value) => viewModel.updateName(value),
                        isErrorValid: viewModel.validateUserName,
                      ),
                      if (viewModel.errorMessageName.isNotEmpty)
                        Column(
                          children: [
                            verticalSpaceTiny,
                            Text(viewModel.errorMessageName,
                                style: const TextStyle(fontSize: AppFontSize.font12, color: kcRedColor)),
                          ],
                        ),

                      verticalSpaceSmall,
                      // Password
                      CustomText(
                        title: translate(AppStrings.password),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      ),
                      CustomFieldInput(
                        hintText: '*********',
                        onChange: (value) => viewModel.updatePassword(value),
                        isErrorValid: viewModel.validatePassword,
                        showPassword: false,
                      ),
                      if (viewModel.errorMessagePassword.isNotEmpty)
                        Column(
                          children: [
                            verticalSpaceTiny,
                            Text(viewModel.errorMessagePassword,
                                style: const TextStyle(fontSize: AppFontSize.font12, color: kcRedColor)),
                          ],
                        ),

                      verticalSpaceMedium,
                      GestureDetector(
                        onTap: () {
                          viewModel.navToTerm();
                        },
                        child: Center(
                          child: Column(
                            children: [
                              CustomText(
                                title: translate(AppStrings.continueAgree),
                                fontSize: AppFontSize.font14,
                              ),
                              verticalSpaceSmall,
                              CustomText(
                                title: translate(AppStrings.termsAndCondition),
                                fontSize: AppFontSize.font14,
                                fontWeight: AppFontWeight.bold,
                                onTap: viewModel.navToTerm,
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: translate(AppStrings.createAccount),
                              onTap: () => viewModel.registerBtn(email,phone),
                            ),
                          ),
                        ],
                      ),
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
  CreateAccountViewModel viewModelBuilder(BuildContext context) => CreateAccountViewModel();

  @override
  void onViewModelReady(CreateAccountViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getPages();
  }
}
