import 'package:example/models/reservation_details.dart';
import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/container/custom_item.dart';

import 'confirm_reservation_viewmodel.dart';

class ConfirmReservationView extends StackedView<ConfirmReservationViewModel> {
  final ReservationDetailsModel data;
  const ConfirmReservationView({Key? key, required this.data})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmReservationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: const CustomAppBar(titleText: AppStrings.confirmReservation),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: kcWhiteColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: translate(AppStrings.pay),
                        colorButton: kcSecondaryColor,
                        onTap: () => viewModel.confirmPay(data.id.toString(),
                            num.parse(data.total.toString())),
                      ),
                    ),
                  ],
                ),
                // CustomText(
                //   title: translate(AppStrings.editReservation),
                //   fontWeight: FontWeight.bold,
                //   padding: const EdgeInsets.all(10),
                // ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              if (data.yacht != null)
                CustomItem(
                  data: data.yacht!,
                  onTapFav: () => null,
                ),
              // verticalSpaceSmall,
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: kcBorderColor.withOpacity(0.3)),
              //     color: kcPrimaryColor,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.all(8),
              //   child: CustomText(
              //     title: 'You can pay after provider confirm your reservation',
              //     maxLines: 2,
              //     textOverflow: TextOverflow.ellipsis,
              //     fontSize: AppFontSize.font12,
              //     textColor: kcWhiteColor,
              //   ),
              // ),
              verticalSpaceSmall,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kcBorderColor.withOpacity(0.3)),
                  color: kcWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: translate(AppStrings.reservationDetails) + ":",
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font14,
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpaceSmall,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: translate(AppStrings.reservationName),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title: data.user?.name ?? '',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: translate(AppStrings.mobile),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title: data.user?.phone ?? '',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: translate(AppStrings.date),
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: AppFontSize.font14,
                            textColor: kcTextBlackColor,
                          ),
                          CustomText(
                            title: data.date ?? '',
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: AppFontSize.font14,
                            textColor: kcSecondaryColor,
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      CustomText(
                        title: translate(AppStrings.otherNotes) + ":",
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font14,
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpaceTiny,
                      CustomText(
                        title: data.note ?? '',
                        maxLines: 10,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font14,
                        textColor: kcTextBlackColor,
                      ),
                      verticalSpaceSmall,
                    ]),
              ),
              verticalSpaceSmall,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kcBorderColor.withOpacity(0.3)),
                  color: kcWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: translate(AppStrings.paymentSummary) + ":",
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font14,
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpaceSmall,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: translate(AppStrings.price),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title:
                                    '${data.total} ${AppStrings.defaultCurrency}',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: translate(AppStrings.vat),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title:
                                    '${viewModel.settingModel?.vat ?? '0'} ${AppStrings.defaultCurrency}',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: translate(AppStrings.serviceFee),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title:
                                    '${viewModel.settingModel?.serviceFee ?? '0'} ${AppStrings.defaultCurrency}',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: translate(AppStrings.total),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title:
                                    '${viewModel.calculateTotal(num.parse(data.total.toString() ?? '0'))} ${AppStrings.defaultCurrency}',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              verticalSpaceSmall,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kcBorderColor.withOpacity(0.3)),
                  color: kcWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: translate(AppStrings.choosePaymentMethod) + ":",
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font14,
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpaceSmall,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.changePaymentMethod(0);
                            },
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  viewModel.paymentMethod == 0
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: viewModel.paymentMethod == 0
                                      ? kcPrimaryColor
                                      : kcTextBlackColor,
                                ),
                                horizontalSpaceSmall,
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    const CustomText(
                                      title: 'Cash',
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontSize: AppFontSize.font14,
                                      textColor: kcTextBlackColor,
                                    ),
                                    horizontalSpaceTiny,
                                    CustomText(
                                      title:
                                          "(${translate(AppStrings.payToYacht)})",
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontSize: AppFontSize.font12,
                                      textColor: kcMediumGrey,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Assets.svg.cash.svg()
                              ],
                            ),
                          ),
                          // verticalSpaceTiny,
                          // Row(
                          //   children: [
                          //     Icon(Icons.radio_button_off,
                          //         color: kcTextBlackColor),
                          //     horizontalSpaceSmall,
                          //     Wrap(
                          //       crossAxisAlignment: WrapCrossAlignment.center,
                          //       children: [
                          //         CustomText(
                          //           title: 'Apple Pay',
                          //           maxLines: 1,
                          //           textOverflow: TextOverflow.ellipsis,
                          //           fontSize: AppFontSize.font14,
                          //           textColor: kcTextBlackColor,
                          //         ),
                          //         horizontalSpaceTiny,
                          //         CustomText(
                          //           title:
                          //               "(${translate(AppStrings.requiredAppleAcc)})",
                          //           maxLines: 1,
                          //           textOverflow: TextOverflow.ellipsis,
                          //           fontSize: AppFontSize.font12,
                          //           textColor: kcMediumGrey,
                          //         ),
                          //       ],
                          //     ),
                          //     Spacer(),
                          //     Assets.svg.applePay.svg()
                          //   ],
                          // ),
                          verticalSpaceTiny,
                          GestureDetector(
                            onTap: () {
                              viewModel.changePaymentMethod(1);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  viewModel.paymentMethod == 1
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: viewModel.paymentMethod == 1
                                      ? kcPrimaryColor
                                      : kcTextBlackColor,
                                ),
                                horizontalSpaceSmall,
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    const CustomText(
                                      title: 'Credit/Debit',
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontSize: AppFontSize.font14,
                                      textColor: kcTextBlackColor,
                                    ),
                                    horizontalSpaceTiny,
                                    CustomText(
                                      title:
                                          "(${translate(AppStrings.acceptVisaMaster)})",
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontSize: AppFontSize.font12,
                                      textColor: kcMediumGrey,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(Icons.credit_card)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ConfirmReservationViewModel viewModelBuilder(BuildContext context) =>
      ConfirmReservationViewModel();
  @override
  void onViewModelReady(ConfirmReservationViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getSettings();
  }
}
