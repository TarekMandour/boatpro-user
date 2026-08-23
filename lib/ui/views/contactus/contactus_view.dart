import 'package:example/ui/index.dart';
import 'contactus_viewmodel.dart';

class ContactusView extends StackedView<ContactusViewModel> {
  const ContactusView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactusViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => Helper.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: CustomAppBar(titleText: AppStrings.contactus),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                Center(child: Assets.svg.contact.svg()),
                verticalSpaceMedium,
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
                            title: '+966', fontSize: AppFontSize.font14),
                      ],
                    ),
                  ),
                  hintText: 'xxx-xxxx-xxx',
                  onChange: (value) => viewModel.updatePhone(value),
                  isErrorValid: viewModel.validatePhone,
                ),
                if (viewModel.errorMessagePhone.isNotEmpty)
                  Column(
                    children: [
                      verticalSpaceTiny,
                      Text(viewModel.errorMessagePhone,
                          style: const TextStyle(
                              fontSize: AppFontSize.font12, color: kcRedColor)),
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
                verticalSpaceSmall,
                // Description
                CustomText(
                  title: translate(AppStrings.writeDescription),
                  fontSize: AppFontSize.font14,
                  fontWeight: AppFontWeight.bold,
                  padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                ),
                CustomFieldInput(
                  hintText: translate(AppStrings.writeDescription),
                  maxLines: 5,
                  onChange: (value) => viewModel.updateDescription(value),
                  isErrorValid: viewModel.validateDescription,
                ),
                if (viewModel.errorMessageDescription.isNotEmpty)
                  Column(
                    children: [
                      verticalSpaceTiny,
                      Text(viewModel.errorMessageDescription,
                          style: const TextStyle(
                              fontSize: AppFontSize.font12, color: kcRedColor)),
                    ],
                  ),
                verticalSpaceMedium,
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: translate(AppStrings.send),
                        onTap: viewModel.sendBtn,
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
    );
  }

  @override
  ContactusViewModel viewModelBuilder(BuildContext context) =>
      ContactusViewModel();
}
