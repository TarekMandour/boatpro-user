import 'package:example/models/yacht.dart';
import 'package:example/ui/index.dart';

import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  final YachtModel data;
  const DetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeightFraction(context) / 3.5),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
              child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                  color: kcWhiteColor, borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.arrow_back, color: kcTextBlackColor),
            ),
          )),
          actions: [
            Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Assets.svg.share.svg(),
                  )),
            )
          ],
          flexibleSpace: Banners(
            items: data.image?.map((e) => e).toList() ?? [],
            dividedBy: 0,
            fullscreen: true,
            radius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kcWhiteColor,
            border: Border.all(color: kcPrimaryColor),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (data.isDiscount == 0)
                    CustomText(
                      title: '${data.price} ${AppStrings.defaultCurrency}',
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.font16,
                      textColor: kcSecondaryColor,
                    ),
                  if (data.isDiscount == 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title:
                              '${data.discountValue} ${AppStrings.defaultCurrency}',
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          fontWeight: AppFontWeight.bold,
                          fontSize: AppFontSize.font16,
                          textColor: kcSecondaryColor,
                        ),
                        verticalSpaceTiny,
                        CustomText(
                          title: '${data.price} ${AppStrings.defaultCurrency}',
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: AppFontSize.font12,
                          textColor: kcPrimaryColor,
                          lineThrough: true,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Expanded(
                flex: 0,
                child: CustomButton(
                  text: translate(AppStrings.bookNow),
                  onTap: () {
                    viewModel.navigateToBookYachtView(data.id.toString());
                  },
                ))
          ],
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
                  Expanded(
                    flex: 1,
                    child: CustomText(
                      title: data.name ?? '',
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.font18,
                      textColor: kcSecondaryColor,
                    ),
                  ),
                  Expanded(
                      flex: 0,
                      child: GestureDetector(
                          onTap: () => viewModel.addFavourite(data),
                          child: Assets.svg.bookmark.svg(
                              color: (data.isFav ?? false)
                                  ? kcSecondaryColor
                                  : null))),
                ],
              ),
              verticalSpaceTiny,
              CustomText(
                title: data.address ?? '',
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcSecondaryColor,
              ),
              verticalSpaceTiny,
              CustomText(
                title:
                    '${data.reservations} ${translate(AppStrings.reservations)}',
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcSecondaryColor,
              ),
              verticalSpaceSmall,
              CustomTile(
                colorBg: kcPrimaryColor.withOpacity(0.1),
                colorBorder: kcPrimaryColor,
                leadChild: CircleAvatar(
                  backgroundColor: kcSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          data.provider?.image ?? AppStrings.placeHolderImages),
                      backgroundColor: kcPrimaryColor,
                    ),
                  ),
                ),
                titleChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      title: data.provider?.name ?? '',
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
                  data.provider?.id.toString() ?? '',
                  data.provider?.name.toString() ?? '',
                  data.provider?.image.toString() ?? '',
                ),
                trailingChild: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kcSecondaryColor),
                    child: Center(
                        child: Assets.svg.chat.svg(color: kcWhiteColor))),
              ),
              verticalSpaceSmall,
              CustomText(
                title: translate(AppStrings.description),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                fontWeight: FontWeight.bold,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceTiny,
              CustomText(
                title: data.description ?? '',
                maxLines: 5,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceSmall,
              CustomText(
                title: translate(AppStrings.specification),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                fontWeight: FontWeight.bold,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceTiny,
              Wrap(
                children: data.specifications!
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Chip(
                            label: CustomText(
                              title: Helper.isArabic()
                                  ? e.nameAr ?? ''
                                  : e.nameEn ?? '',
                              textColor: kcSecondaryColor,
                            ),
                            avatar: e.icon == ''
                                ? Assets.svg.info.svg()
                                : Image.network(
                                    e.icon ?? AppStrings.placeHolderImages),
                            backgroundColor: kcPrimaryColor.withOpacity(0.2)),
                      ),
                    )
                    .toList(),
              ),
              verticalSpaceSmall,
              CustomText(
                title: translate(AppStrings.additionalInfo),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                fontWeight: FontWeight.bold,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceTiny,
              CustomText(
                title: data.addInfo ?? '',
                maxLines: 5,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceSmall,
              CustomText(
                title: translate(AppStrings.bookingInfo),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                fontWeight: FontWeight.bold,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceTiny,
              CustomText(
                title: data.bookingInfo ?? '',
                maxLines: 5,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceMassive,
            ],
          ),
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(BuildContext context) => DetailsViewModel();
}
