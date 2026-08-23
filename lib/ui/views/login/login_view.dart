import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/custom_web_view.dart';
import 'package:example/utils/validators.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => Helper.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(screenHeightFraction(context, dividedBy: 4)),
          child: AppBar(
            automaticallyImplyLeading: false,
            // hides leading widget
            flexibleSpace: Assets.svg.appbar.svg(fit: BoxFit.cover),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Assets.images.logo.image(height: 80),
            centerTitle: true,
            toolbarHeight: screenHeightFraction(context, dividedBy: 5),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Column(
                  children: [
                    CustomText(
                        title: translate(AppStrings.login),
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.font24),
                    CustomText(title: translate(AppStrings.welcomeBoard)),
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
                verticalSpaceSmall,
                // Phone Number
                CustomText(
                  title: translate(AppStrings.email),
                  fontSize: AppFontSize.font14,
                  fontWeight: AppFontWeight.bold,
                  padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                ),
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
                                fontSize: AppFontSize.font12, color: kcRedColor)),
                      ],
                    ),
                // CustomFieldInput(
                //   leading: Container(
                //     padding: const EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //       color: kcSecondaryColor.withOpacity(0.15),
                //       borderRadius: Helper.isArabic()
                //           ? BorderRadius.only(
                //               topRight: Radius.circular(100),
                //               bottomRight: Radius.circular(100))
                //           : BorderRadius.only(
                //               topLeft: Radius.circular(100),
                //               bottomLeft: Radius.circular(100)),
                //     ),
                //     child: Wrap(
                //       alignment: WrapAlignment.center,
                //       crossAxisAlignment: WrapCrossAlignment.center,
                //       children: [
                //         Assets.svg.saudiArabia.svg(),
                //         horizontalSpaceTiny,
                //         const CustomText(
                //             title: '+966', fontSize: AppFontSize.font14),
                //       ],
                //     ),
                //   ),
                //   hintText: 'xxx-xxxx-xxx',
                //   onChange: (value) => viewModel.updatePhone(value),
                //   isErrorValid: viewModel.validatePhone,
                // ),
                // if (viewModel.errorMessagePhone.isNotEmpty)
                //   Column(
                //     children: [
                //       verticalSpaceTiny,
                //       Text(viewModel.errorMessagePhone,
                //           style: const TextStyle(
                //               fontSize: AppFontSize.font12, color: kcRedColor)),
                //     ],
                //   ),
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
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // // Remember Data
                    // GestureDetector(
                    //   onTap: viewModel.updateRememeber,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       CustomCheckBox(
                    //         isSelected: viewModel.isRememberData,
                    //         onTap: viewModel.updateRememeber,
                    //       ),
                    //       CustomText(
                    //         title: translate(AppStrings.rememberData),
                    //         fontSize: AppFontSize.font14,
                    //         fontWeight: AppFontWeight.bold,
                    //         padding: const EdgeInsets.only(
                    //             bottom: 10, left: 5, right: 5),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Forget Password
                    CustomText(
                      title: translate(AppStrings.forgetPassword),
                      fontSize: AppFontSize.font14,
                      fontWeight: AppFontWeight.bold,
                      padding:
                          const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                      onTap: viewModel.navigateToForgetPasswordView,
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: translate(AppStrings.login),
                        onTap: viewModel.loginBtn,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                // verticalSpaceMedium,
                // Row(
                //   children: [
                //     Expanded(
                //       child: CustomButton(
                //         text: 'Google',
                //         icon: Assets.svg.google.svg(),
                //         isSecondary: true,
                //         visibleIcon: true,
                //         colorButton: kcBorderColor,
                //         colorText: kcDarkGreyColor,
                //         onTap: () {
                //           viewModel.loginBySocial('google');
                //         },
                //       ),
                //     ),
                //     horizontalSpaceSmall,
                //     Expanded(
                //       child: CustomButton(
                //         text: 'Twitter',
                //         icon: Assets.svg.twitter.svg(),
                //         visibleIcon: true,
                //         colorButton: kcTwitterColor,
                //         colorText: kcWhiteColor,
                //         onTap: () {
                //           viewModel.loginBySocial('twitter');
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // verticalSpaceMedium,
                // verticalSpaceMedium,
                Center(
                  child: Column(
                    children: [
                      CustomText(
                        title: translate(AppStrings.dontHaveAccount),
                        fontSize: AppFontSize.font14,
                      ),
                      verticalSpaceSmall,
                      CustomText(
                        title: translate(AppStrings.createNewAccount),
                        fontSize: AppFontSize.font14,
                        fontWeight: AppFontWeight.bold,
                        onTap: viewModel.registerBtn,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}

class CustomCheckBox extends StatelessWidget {
  final bool isSelected;
  final GestureTapCallback? onTap;

  const CustomCheckBox({
    super.key,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 16,
        height: 16,
        margin: const EdgeInsets.only(top: 2),
        decoration: ShapeDecoration(
          color: isSelected ? kcPrimaryColor : kcWhiteColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: kcPrimaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: isSelected
            ? const Icon(Icons.check, size: 12, color: kcWhiteColor)
            : Container(),
      ),
    );
  }
}
