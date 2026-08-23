import 'package:example/ui/index.dart';

import 'otp_viewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StackedView<OtpViewModel> {
  final bool isChangePassword;
  final String phone;
  final String email;
  const OtpView({Key? key, required this.isChangePassword, required this.phone, required this.email})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => Helper.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: kcWhiteColor,
        appBar: const CustomAppBar(titleText: AppStrings.otp),
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
                        title: translate(AppStrings.emailVerification),
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.font24,
                        maxLines: 2,
                      ),
                      verticalSpaceSmall,
                      CustomText(title: translate(AppStrings.sendedCode)),
                      verticalSpaceSmall,
                      CustomText(
                        title: '$phone',
                        textColor: kcPrimaryColor,
                      ),
                      verticalSpaceSmall,
                      CustomText(title: translate(AppStrings.emailVerification)),
                      verticalSpaceMedium,
                      Center(
                        child: PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          enablePinAutofill: true,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              fieldWidth: 70,
                              borderRadius: BorderRadius.circular(16),
                              activeFillColor: Colors.white,
                              borderWidth: 0.5,
                              fieldHeight: 70,
                              fieldOuterPadding: const EdgeInsets.all(4),
                              selectedFillColor: Colors.white,
                              selectedColor: kcSecondaryColor,
                              errorBorderColor: kcErrorColor,
                              activeColor: kcPrimaryColor,
                              inactiveColor: kcMediumGrey,
                              inactiveFillColor: Colors.white),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          onCompleted: viewModel.updateVerifyCode,
                          onChanged: viewModel.updateVerifyCode,
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                          appContext: context,
                          errorTextSpace: 25,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(viewModel.errorMessage,
                          style: const TextStyle(
                              fontSize: AppFontSize.font12, color: kcRedColor)),
                      verticalSpaceSmall,
                      verticalSpaceMedium,
                      if (isChangePassword)
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: translate(AppStrings.changePassword),
                                onTap: () =>
                                    viewModel.sendOtp(phone, email,isChangePassword),
                              ),
                            ),
                          ],
                        ),
                      if (!isChangePassword)
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: translate(AppStrings.completeRegister),
                                onTap: () =>
                                    viewModel.sendOtp(phone, email, isChangePassword),
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
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}
