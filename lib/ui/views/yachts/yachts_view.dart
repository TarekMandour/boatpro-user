import 'package:example/ui/index.dart';
import 'package:example/ui/views/yachts/yachts_viewmodel.dart';
import 'package:example/ui/widgets/container/custom_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class YachtsView extends StackedView<YachtsViewModel> {
  final String countryId, serviceId;

  const YachtsView({Key? key, required this.countryId, required this.serviceId})
      : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    YachtsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: AppBar(
        backgroundColor: kcSecondaryColor,
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
        title: CustomText(
          title: translate(AppStrings.availableYachts),
          textColor: kcWhiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        // bottom: PreferredSize(
        //     preferredSize: const Size.fromHeight(0.0),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: Container(
        //         margin: const EdgeInsets.only(bottom: 10),
        //         decoration: BoxDecoration(
        //             color: kcBgLightColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: kcSecondaryColor.withOpacity(0.5))),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Expanded(
        //               flex: 0,
        //               child: GestureDetector(
        //                 onTap: () {},
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(12.0),
        //                   child: Assets.svg.search.svg(),
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: TextFormField(
        //                 decoration: InputDecoration(
        //                     hintText: translate(AppStrings.searchHint),
        //                     hintStyle: TextStyle(color: kcSecondaryColor, fontSize: AppFontSize.font14),
        //                     border: InputBorder.none),
        //                 onFieldSubmitted: (value) {
        //                   viewModel.getYachts(text: value);
        //                 },
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     )),
      ),
      body: viewModel.yachts.isEmpty && viewModel.isBusy == false
          ? Center(child: CustomText(title: translate(AppStrings.emptyResult)))
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 15, bottom: 15),
                child: Column(
                  children: List.generate(
                      viewModel.yachts.length,
                      (index) => Column(
                            children: [
                              CustomItem(
                                  data: viewModel.yachts[index],
                                  onTapFav: () {
                                    viewModel
                                        .addFavourite(viewModel.yachts[index]);
                                  }),
                              if (index != viewModel.yachts.length - 1)
                                const Divider(color: kcSecondaryColor)
                            ],
                          )),
                ),
              ),
            ),
    );
  }

  @override
  YachtsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      YachtsViewModel();

  @override
  void onViewModelReady(YachtsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getYachts(
      serviceId: serviceId,
      countryId: countryId,
    );
  }
}
