import 'package:example/ui/index.dart';

class CustomReserve extends StatelessWidget {
  final String title, image, total, status, yachtId;
  final GestureTapCallback onTap;
  const CustomReserve({
    super.key,
    required this.title,
    required this.image,
    required this.total,
    required this.status,
    required this.yachtId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kcBorderColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kcPrimaryColor,
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
          width: 60,
          height: 60,
        ),
        minVerticalPadding: 0,
        contentPadding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              title: title,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.font14,
              textColor: kcTextBlackColor,
            ),
            CustomText(
              title: '${total} ${AppStrings.defaultCurrency}',
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.font16,
              textColor: kcSecondaryColor,
            ),
            verticalSpaceTiny,
          ],
        ),
        subtitle: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: status == 'completed'
                    ? kcGreenColor
                    : status == 'in progress'
                        ? kcSecondaryColor
                        : status == 'canceled' || status == 'rejected'
                            ? kcRedColor
                            : kcBorderColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Center(
                child: CustomText(
                  title: status,
                  fontSize: 14,
                  textColor: kcWhiteColor,
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: kcPrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 35,
          height: 35,
          child: Helper.isArabic()
              ? Icon(Icons.keyboard_arrow_left, color: kcPrimaryColor)
              : Icon(Icons.keyboard_arrow_right, color: kcPrimaryColor),
        ),
      ),
    );
  }
}
