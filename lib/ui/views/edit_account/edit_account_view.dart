import 'package:example/ui/index.dart';
import 'edit_account_viewmodel.dart';

class EditAccountView extends StackedView<EditAccountViewModel> {
  const EditAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditAccountViewModel viewModel,
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: translate(AppStrings.save),
                  onTap: viewModel.saveBtn,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,

                // Phone number
                if (viewModel.preferencesService.userData?.phone?.isNotEmpty ??
                    false)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: translate(AppStrings.phoneNumber),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        textColor: kcBorderColor,
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: CustomFieldInput(
                          hintText: viewModel.preferencesService.userData?.phone
                              ?.split('966')
                              .last,
                          readOnly: true,
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kcSecondaryColor.withOpacity(0.15),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                              ),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Assets.svg.saudiArabia.svg(),
                                horizontalSpaceTiny,
                                const CustomText(
                                    title: '+966',
                                    fontSize: AppFontSize.font14),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                verticalSpaceSmall,
                // Email Address
                CustomText(
                  title: translate(AppStrings.email),
                  fontSize: AppFontSize.font14,
                  fontWeight: AppFontWeight.bold,
                  padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                ),
                CustomFieldInput(
                  hintText: viewModel.preferencesService.userData?.email,
                  onChange: (value) => viewModel.updateEmail(value),
                  isErrorValid: viewModel.validateEmail,
                  controller: viewModel.editingControllerEmail,
                  isEnabled: false,
                ),
                if (viewModel.errorMessageEmail.isNotEmpty)
                  Column(
                    children: [
                      verticalSpaceTiny,
                      Text(viewModel.errorMessageEmail,
                          style: const TextStyle(
                              fontSize: AppFontSize.font12, color: kcRedColor)),
                    ],
                  ),
                verticalSpaceSmall,
                CustomText(
                  title: translate(AppStrings.username),
                  fontSize: AppFontSize.font14,
                  fontWeight: AppFontWeight.bold,
                  padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                ),
                CustomFieldInput(
                  hintText: viewModel.preferencesService.userData?.name,
                  onChange: (value) => viewModel.updateName(value),
                  isErrorValid: viewModel.validateName,
                  controller: viewModel.editingControllerName,
                ),
                if (viewModel.errorMessageName.isNotEmpty)
                  Column(
                    children: [
                      verticalSpaceTiny,
                      Text(viewModel.errorMessageName,
                          style: const TextStyle(
                              fontSize: AppFontSize.font12, color: kcRedColor)),
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
                          style: const TextStyle(
                              fontSize: AppFontSize.font12, color: kcRedColor)),
                    ],
                  ),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  EditAccountViewModel viewModelBuilder(BuildContext context) =>
      EditAccountViewModel();

  @override
  void onViewModelReady(EditAccountViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
