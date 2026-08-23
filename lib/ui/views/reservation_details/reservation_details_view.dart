import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/loading.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'reservation_details_viewmodel.dart';

class ReservationDetailsView extends StackedView<ReservationDetailsViewModel> {
  final bool reReserve;
  final String yachtId;

  const ReservationDetailsView({
    Key? key,
    required this.reReserve,
    required this.yachtId,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReservationDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeightFraction(context) / 3.5),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          title: Container(
            decoration: BoxDecoration(
              border: Border.all(color: kcWhiteColor, width: 2),
              color: kcTextBlackColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kcWhiteColor,
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(8),
                      child:
                          const Icon(Icons.arrow_back, color: kcTextBlackColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CustomText(
                      title: translate(AppStrings.reservationsTicket),
                      textColor: kcWhiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Banners(
            items: viewModel.data?.images ?? [],
            dividedBy: 0,
            fullscreen: true,
            radius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
        ),
      ),
      floatingActionButton: viewModel.data?.reservationsStatus == 'completed' ||
              viewModel.data?.reservationsStatus == 'rejected' ||
              viewModel.data?.reservationsStatus == 'canceled'
          ? null
          : Container(
              padding: EdgeInsets.all(10),
              height: 90,
              decoration: BoxDecoration(
                  color: kcWhiteColor,
                  border: Border.all(color: kcBorderColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: CustomTile(
                colorBg: kcPrimaryColor.withOpacity(0.1),
                colorBorder: kcPrimaryColor,
                leadChild: CircleAvatar(
                    backgroundColor: kcSecondaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              viewModel.data?.provider?.image ??
                                  AppStrings.placeHolderImages),
                          backgroundColor: kcPrimaryColor),
                    )),
                titleChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: viewModel.data?.provider?.name ?? '',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      title: translate(AppStrings.serviceProvider),
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      textColor: kcTextColor,
                    ),
                  ],
                ),
                onTap: () => Helper().navigateToConversationView(
                    viewModel.data?.provider?.id.toString() ?? '',
                    viewModel.data?.provider?.name ?? '',
                    viewModel.data?.provider?.image ?? ''),
                trailingChild: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kcSecondaryColor),
                    child: Center(
                        child: Assets.svg.chat.svg(color: kcWhiteColor))),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    title: viewModel.data?.yacht?.name ?? '',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: AppFontWeight.bold,
                    fontSize: AppFontSize.font18,
                    textColor: kcSecondaryColor,
                  ),
                  Spacer(),
                  // if (viewModel.data?.reservationsStatus == 'pending')
                  //   CircularCountDownTimer(
                  //     duration: 10,
                  //     initialDuration: 0,
                  //     width: 50,
                  //     height: 50,
                  //     ringColor: Colors.grey[300]!,
                  //     ringGradient: null,
                  //     fillColor: kcYellowColor,
                  //     fillGradient: null,
                  //     backgroundColor: kcWhiteColor,
                  //     backgroundGradient: null,
                  //     strokeWidth: 5.0,
                  //     strokeCap: StrokeCap.round,
                  //     textFormat: CountdownTextFormat.S,
                  //     isReverse: true,
                  //     isReverseAnimation: false,
                  //     isTimerTextShown: true,
                  //     autoStart: true,
                  //     onStart: () {
                  //       debugPrint('Countdown Started');
                  //     },
                  //     onComplete: () {
                  //       debugPrint('Countdown Ended');
                  //       viewModel.cancelReservation(
                  //           viewModel.data?.id.toString() ?? '');
                  //     },
                  //     onChange: (String timeStamp) {
                  //       debugPrint('Countdown Changed $timeStamp');
                  //     },
                  //     timeFormatterFunction:
                  //         (defaultFormatterFunction, duration) {
                  //       if (duration.inSeconds == 0) {
                  //         return "end";
                  //       } else {
                  //         return Function.apply(
                  //             defaultFormatterFunction, [duration]);
                  //       }
                  //     },
                  //   )
                ],
              ),
              verticalSpaceSmall,
              CustomText(
                title: viewModel.data?.yacht?.address ?? '',
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcSecondaryColor,
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  CustomText(
                    title: translate(AppStrings.reservations),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: AppFontSize.font14,
                    textColor: kcSecondaryColor,
                  ),
                  Spacer(),
                  CustomText(
                    title: viewModel.data?.id.toString() ?? '',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: AppFontSize.font14,
                    textColor: kcTextBlackColor,
                  ),
                ],
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  CustomText(
                    title: translate(AppStrings.date),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: AppFontSize.font14,
                    textColor: kcSecondaryColor,
                  ),
                  Spacer(),
                  CustomText(
                    title: viewModel.data?.date ?? '',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: AppFontSize.font14,
                    textColor: kcTextBlackColor,
                  ),
                ],
              ),
              verticalSpaceMedium,
              if (viewModel.data?.reservationsStatus == 'completed')
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: translate(AppStrings.reReserve),
                        onTap: viewModel.reReserve,
                      ),
                    ),
                  ],
                ),
              if (viewModel.data?.reservationsStatus == 'completed')
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: translate(AppStrings.addReview),
                          colorButton: kcSecondaryColor,
                          onTap: () {
                            viewModel.ratingValue = 0;
                            viewModel.rateCommentController.clear();
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 16,
                                        bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom +
                                            16,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            title: translate(
                                                AppStrings.addReview),
                                            fontSize: AppFontSize.font14,
                                            textColor: kcTextBlackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(height: 10),
                                          Center(
                                            child: RatingStars(
                                              value: viewModel.ratingValue,
                                              onValueChanged: (v) {
                                                setState(() {
                                                  viewModel.ratingValue = v;
                                                });
                                              },
                                              starCount: 5,
                                              starSpacing: 6,
                                              starSize: 35,
                                              valueLabelVisibility: false,
                                              starColor: kcYellowColor,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          TextField(
                                            controller: viewModel
                                                .rateCommentController,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: translate('writeYour_Comment'),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Center(
                                            child: CustomButton(
                                              text:
                                                  translate(AppStrings.submit),
                                              onTap: () async {
                                                if (viewModel.ratingValue ==
                                                    0) return;
                                                Navigator.of(context).pop();
                                                await viewModel.storeRate();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (viewModel.data?.reservationsStatus == 'pending')
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      text: translate(AppStrings.editReservation),
                      onTap: viewModel.navToEditReservation,
                    )),
                  ],
                ),
              if (viewModel.data?.reservationsStatus == 'in progress' &&
                  viewModel.data?.paymentMethod == null)
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: translate(AppStrings.pay),
                        onTap: viewModel.navToPayReservation,
                      ),
                    ),
                  ],
                ),
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: kcBorderColor.withOpacity(0.3)),
              //     color: kcPrimaryColor,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   alignment: Alignment.center,
              //   padding: EdgeInsets.all(8),
              //   child: CustomText(
              //     title: 'Unified Marine will send you a notification 24 hour before date ',
              //     maxLines: 2,
              //     textOverflow: TextOverflow.ellipsis,
              //     fontSize: AppFontSize.font14,
              //     textColor: kcWhiteColor,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              verticalSpaceMedium,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kcBorderColor.withOpacity(0.3)),
                  color: kcWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(10),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: translate(AppStrings.reservationName),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title: viewModel.data?.user?.name ?? '',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      if (viewModel.data?.times?.isNotEmpty ?? false) ...[
                        CustomText(
                          title: Helper.getFormattedDate(
                              viewModel.data?.times?.first.date.toString() ??
                                  ''),
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: AppFontSize.font14,
                          textColor: kcTextBlackColor,
                        ),
                        Column(
                          children: viewModel.data?.times?.map(
                                (e) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        title: Helper.formatTime(
                                                e.startTime.toString()) +
                                            ' - ' +
                                            Helper.formatTime(
                                                e.endTime.toString()),
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: AppFontSize.font14,
                                        textColor: kcSecondaryColor,
                                      ),
                                    ],
                                  );
                                },
                              ).toList() ??
                              [],
                        ),
                      ],
                      Divider(),
                      CustomText(
                        title: translate(AppStrings.paymentDetails) + ":",
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font14,
                        textColor: kcTextBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: translate(AppStrings.totalPrice),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title:
                                    '${viewModel.data?.total ?? '0'} ${AppStrings.defaultCurrency}',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: translate(AppStrings.paymentMethod),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              CustomText(
                                title: viewModel.data?.paymentMethod ?? '',
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcSecondaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
              verticalSpaceMedium,
              if (viewModel.data?.reservationsStatus == 'pending')
                GestureDetector(
                  onTap: () {
                    viewModel.reasonController.clear();
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: translate(AppStrings.enterReason),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                fontSize: AppFontSize.font14,
                                textColor: kcTextBlackColor,
                              ),
                              SizedBox(height: 10),
                              TextField(
                                controller: viewModel.reasonController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: translate(AppStrings.reason),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: CustomButton(
                                  text: translate(AppStrings.submit),
                                  colorButton: kcSecondaryColor,
                                  onTap: () {
                                    String reason =
                                        viewModel.reasonController.text;
                                    if (reason.isEmpty) {
                                      return;
                                    }
                                    viewModel.cancelReservation(
                                        (viewModel.data?.id ?? 0).toString());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Center(
                    child: CustomText(
                      title: translate(AppStrings.cancelReservation),
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: AppFontSize.font14,
                      textColor: kcTextBlackColor,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              verticalSpaceTiny,
              if (viewModel.data?.reservationsStatus == 'pending')
                Center(
                  child: CustomText(
                    title: translate(AppStrings.cancelBefore),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: AppFontSize.font12,
                    textColor: kcTextBlackColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              verticalSpaceSmall,
              SizedBox(
                height: 180,
                width: double.infinity,
                child: !viewModel.isMapReady
                    ? CustomLoading()
                    : Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            myLocationButtonEnabled: false,
                            myLocationEnabled: false,
                            markers: viewModel.markers,
                            zoomControlsEnabled: false,
                            onTap: (e) async {
                              String googleUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${viewModel.data?.yacht?.latitude ?? 0.0},${viewModel.data?.yacht?.longitude ?? 0.0}';
                              if (!await launchUrl(Uri.parse(googleUrl))) {
                                debugPrint('Could not launch $googleUrl');
                              }
                            },
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                (viewModel.data?.yacht?.latitude ?? 0.0)
                                    .toDouble(),
                                (viewModel.data?.yacht?.longitude ?? 0.0)
                                    .toDouble(),
                              ),
                              zoom: 14,
                            ),
                            onMapCreated: viewModel.onMapCreated,
                          ),
                        ],
                      ),
              ),
              verticalSpaceMassive,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ReservationDetailsViewModel viewModelBuilder(BuildContext context) =>
      ReservationDetailsViewModel();

  @override
  void onViewModelReady(ReservationDetailsViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    await viewModel.getReservationDetails(yachtId);
  }
}
