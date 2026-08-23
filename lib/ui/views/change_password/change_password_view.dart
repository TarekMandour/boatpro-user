import 'package:example/ui/index.dart';
import 'change_password_viewmodel.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  final String phone;
  const ChangePasswordView({Key? key, required this.phone}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => Helper.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: const CustomAppBar(
          titleText: AppStrings.changePassword,
          backButton: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
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

                      // Password
                      CustomText(
                        title: translate(AppStrings.password),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
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
                                style: const TextStyle(
                                    fontSize: AppFontSize.font12,
                                    color: kcRedColor)),
                          ],
                        ),

                      verticalSpaceSmall,

                      // Confirm Password
                      CustomText(
                        title: translate(AppStrings.confirmPassword),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                      ),
                      CustomFieldInput(
                        hintText: '*********',
                        onChange: (value) =>
                            viewModel.updateConfirmPassword(value),
                        isErrorValid: viewModel.validateConfirmPassword,
                        showPassword: false,
                      ),
                      if (viewModel.errorMessageConfirmPassword.isNotEmpty)
                        Column(
                          children: [
                            verticalSpaceTiny,
                            Text(viewModel.errorMessageConfirmPassword,
                                style: const TextStyle(
                                    fontSize: AppFontSize.font12,
                                    color: kcRedColor)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: translate(AppStrings.changePassword),
                      onTap: () => viewModel.changePassword(phone),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
