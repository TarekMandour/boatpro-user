import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';

class CustomProvider extends StatelessWidget {
  final String? title;
  final String? image;
  final Function()? onTap;
  const CustomProvider({
    super.key,
    this.onTap,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
          backgroundColor: kcSecondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: CircleAvatar(
                backgroundImage: image != null && image!.isNotEmpty
                    ? CachedNetworkImageProvider(image!)
                    : const AssetImage('assets/images/logo_single.png') as ImageProvider,
                backgroundColor: kcPrimaryColor),
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            title: title ?? '',
            fontWeight: FontWeight.bold,
          ),
          verticalSpaceTiny,
          CustomText(
            title: translate(AppStrings.serviceProvider),
            fontWeight: FontWeight.normal,
            fontSize: 12,
            textColor: kcTextColor,
          ),
          verticalSpaceTiny,
        ],
      ),
      // subtitle: CustomText(
      //   title: 'Saudi Arabia , El-Ryadiah',
      //   fontWeight: FontWeight.normal,
      //   fontSize: 14,
      //   textColor: kcSecondaryColor,
      // ),
      // onTap: viewModel.navigateToConversationView,
    );
  }
}
