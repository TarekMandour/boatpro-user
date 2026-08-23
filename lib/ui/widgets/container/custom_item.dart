import 'package:example/models/yacht.dart';
import 'package:example/ui/index.dart';

class CustomItem extends StatelessWidget {
  final YachtModel data;
  final GestureTapCallback onTapFav;
  const CustomItem({
    super.key,
    required this.data,
    required this.onTapFav,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kcPrimaryColor,
            image: DecorationImage(
                image: NetworkImage(
                    data.image?.first ?? AppStrings.placeHolderImages),
                fit: BoxFit.cover)),
        width: 60,
        height: 60,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
                  fontSize: AppFontSize.font14,
                  textColor: kcSecondaryColor,
                ),
              ),
              Expanded(
                  flex: 0,
                  child: GestureDetector(
                    onTap: onTapFav,
                    child: Assets.svg.bookmark.svg(
                        color: (data.isFav ?? false) ? kcPrimaryColor : null),
                  )),
            ],
          ),
          CustomText(
            title: data.address ?? '',
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            fontSize: AppFontSize.font12,
            textColor: kcSecondaryColor,
          ),
          verticalSpaceTiny,
          CustomText(
            title:
                '${data.reservations ?? 0} ${translate(AppStrings.reservations)}',
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            fontSize: AppFontSize.font12,
            textColor: kcTextColor,
          ),
          Row(
            children: [
              if (data.isDiscount == 0)
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(
                        title:
                            '${data.price ?? 0} ${AppStrings.defaultCurrency}',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.font16,
                        textColor: kcSecondaryColor,
                      ),
                    ],
                  ),
                ),
              if (data.isDiscount == 1)
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(
                        title:
                            '${data.discountValue ?? 0} ${AppStrings.defaultCurrency}',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.font16,
                        textColor: kcSecondaryColor,
                      ),
                      horizontalSpaceTiny,
                      CustomText(
                        title:
                            '${data.price ?? 0} ${AppStrings.defaultCurrency}',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font12,
                        textColor: kcPrimaryColor,
                        lineThrough: true,
                      ),
                    ],
                  ),
                ),
              Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.star, color: kcYellowColor, size: 20),
                        horizontalSpaceTiny,
                        CustomText(
                          title: (data.rate ?? 0).toDouble().toString(),
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          fontWeight: AppFontWeight.bold,
                          fontSize: AppFontSize.font12,
                          textColor: kcSecondaryColor,
                        ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
      onTap: () {
        final _navigationService = locator<NavigationService>();
        _navigationService.navigateToDetailsView(data: data);
      },
    );
  }
}
