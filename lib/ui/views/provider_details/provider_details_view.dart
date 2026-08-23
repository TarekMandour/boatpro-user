import 'package:example/models/provider.dart';
import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/container/custom_item.dart';
import 'package:example/ui/widgets/container/custom_reserve.dart';

import '../../widgets/container/custom_review.dart';
import 'provider_details_viewmodel.dart';

class ProviderDetailsView extends StackedView<ProviderDetailsViewModel> {
  final ProviderModel data;

  const ProviderDetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProviderDetailsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            print(tabController.index);
          }
        });
        return Scaffold(
          backgroundColor: kcWhiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeightFraction(context) / 7.5),
            child: AppBar(
              backgroundColor: kcSecondaryColor,
              elevation: 0,
              leading: Center(
                  child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_back, color: kcTextBlackColor),
                ),
              )),
              title: CustomText(
                title: translate(AppStrings.serviceProvider),
                textColor: kcWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              flexibleSpace: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 20,
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: kcWhiteColor,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              data.image ?? AppStrings.placeHolderImages),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 15,
                      bottom: -30,
                      child: CircleAvatar(
                          backgroundColor: kcWhiteColor,
                          radius: 30,
                          child: Assets.images.logo.image(height: 40))),
                ],
              ),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 50),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: kcSecondaryColor, width: 0.5))),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            title: data.name ?? '',
                            fontWeight: FontWeight.bold,
                            textColor: kcSecondaryColor,
                            fontSize: 16,
                          ),
                          CustomText(
                            title: translate(AppStrings.serviceProvider),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            textColor: kcTextColor,
                          ),
                        ],
                      ),
                      onTap: () => Helper().navigateToConversationView(
                        data.id.toString(),
                        data.name.toString(),
                        data.image.toString(),
                      ),
                      trailing: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kcSecondaryColor),
                        child: Center(
                          child: Assets.svg.chat.svg(color: kcWhiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: TabBar(
                    labelColor: kcMediumGrey,
                    labelPadding: const EdgeInsets.all(0),
                    indicatorColor: kcPrimaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: translate(AppStrings.all)),
                      Tab(text: translate(AppStrings.reviews)),
                    ],
                  ),
                ),
                verticalSpaceSmall,
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                                  viewModel.yachts.length,
                                  (index) => CustomItem(
                                        data: viewModel.yachts[index],
                                        onTapFav: () {
                                          viewModel.addFavourite(
                                              data.id.toString(),
                                              viewModel.yachts[index].id
                                                  .toString());
                                        },
                                      )))),
                      SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                                  viewModel.rates.length,
                                  (index) => CustomReview(
                                      data: viewModel.rates[index])))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  ProviderDetailsViewModel viewModelBuilder(BuildContext context) =>
      ProviderDetailsViewModel();

  @override
  void onViewModelReady(ProviderDetailsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init(data.id);
  }
}
