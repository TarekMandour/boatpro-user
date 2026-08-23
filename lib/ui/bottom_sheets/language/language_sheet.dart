import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/common/app_colors.dart';
import 'package:example/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'language_sheet_model.dart';

class LanguageSheet extends StackedView<LanguageSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const LanguageSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LanguageSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceSmall,
          Center(
            child: Text(
              request.title ?? '',
              style: const TextStyle(
                  fontSize: AppFontSize.font18,
                  fontWeight: FontWeight.w900,
                  color: kcPrimaryColor),
            ),
          ),
          verticalSpaceTiny,
          ListTile(
            leading: viewModel.checkRadioButtonLanguage(LanguageType.english),
            title: Text(translate(AppStrings.english),
                style: const TextStyle(fontSize: AppFontSize.font16)),
            trailing: Assets.svg.unitedKingdom.svg(),
            dense: true,
            onTap: () => viewModel.changeLanguageValue(LanguageType.english),
          ),
          ListTile(
            leading: viewModel.checkRadioButtonLanguage(LanguageType.arabic),
            title: Text(translate(AppStrings.arabic),
                style: const TextStyle(fontSize: AppFontSize.font16)),
            trailing: Assets.svg.saudiArabia.svg(),
            dense: true,
            onTap: () => viewModel.changeLanguageValue(LanguageType.arabic),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: request.mainButtonTitle ?? '',
                    onTap: () {
                      viewModel.changeLanguage(
                          context: context, lang: viewModel.languageModel);
                      completer!(SheetResponse());
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    );
  }

  @override
  LanguageSheetModel viewModelBuilder(BuildContext context) =>
      LanguageSheetModel();

  @override
  void onViewModelReady(LanguageSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
