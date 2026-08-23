import 'package:example/models/rate.dart';
import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class CustomReview extends StatelessWidget {
  final RateModel data;
  const CustomReview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kcWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x1E444444),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kcPrimaryColor,
                    image: DecorationImage(
                        image: NetworkImage(
                            data.user?.image ?? AppStrings.placeHolderImages),
                        fit: BoxFit.cover)),
                width: 40,
                height: 40,
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: data.user?.name ?? '',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontWeight: AppFontWeight.bold,
                    fontSize: AppFontSize.font14,
                  ),
                  verticalSpaceTiny,
                  Wrap(
                    children: [
                      RatingStars(
                        value: data.stars?.toDouble() ?? 0,
                        onValueChanged: (v) {},
                        starCount: 5,
                        starSpacing: 2,
                        starSize: 15,
                        valueLabelVisibility: false,
                        starColor: kcYellowColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              flex: 0,
              child: CustomText(
                title: Helper.getFormattedDate(data.date.toString()),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font12,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: data.comment ?? '',
              maxLines: 10,
              textOverflow: TextOverflow.ellipsis,
              fontSize: AppFontSize.font14,
            ),
          ],
        ),
      ),
    );
  }
}
