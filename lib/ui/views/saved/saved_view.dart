import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/container/custom_item.dart';
import 'saved_viewmodel.dart';

class SavedView extends StackedView<SavedViewModel> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBgDarkColor,
      appBar: const CustomAppBar(titleText: AppStrings.savedYachts),
      body: viewModel.yachts.isEmpty && viewModel.isBusy == false
          ? Center(child: CustomText(title: translate(AppStrings.emptyResult)))
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: List.generate(
                    viewModel.yachts.length,
                    (index) => Column(
                      children: [
                        CustomItem(
                          data: viewModel.yachts[index],
                          onTapFav: () {
                            viewModel.addFavourite(viewModel.yachts[index]);
                          },
                        ),
                        if (index != viewModel.yachts.length - 1)
                          Opacity(
                            opacity: 0.25,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 5, top: 5),
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: kcSecondaryColor),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  SavedViewModel viewModelBuilder(BuildContext context) => SavedViewModel();

  @override
  void onViewModelReady(SavedViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getFavouritesYacht();
  }
}
