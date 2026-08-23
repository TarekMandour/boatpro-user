import 'package:example/models/country.dart';
import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/container/custom_provider.dart';
import 'package:example/utils/geocoding.dart';

import 'home_viewmodel.dart';
import 'dart:convert';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {

    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeightFraction(context) / 6.4),
        child: AppBar(
          backgroundColor: kcSecondaryColor,
          elevation: 0,
          title: ListTile(
            contentPadding: const EdgeInsets.only(top: 10),
            title: CustomText(
              title: translate(AppStrings.location),
              textColor: kcWhiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
              subtitle: CustomText(
                title: viewModel.currentAddress ?? '',
                textColor: kcWhiteColor,
                fontSize: 12,
                maxLines: 1,
              ),
            trailing: GestureDetector(
              onTap: viewModel.navigateToNotificationsView,
              child: Assets.svg.notification.svg(color: kcWhiteColor),
            ),
          ),
          centerTitle: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: GestureDetector(
                onTap: () {
                  viewModel.navigateToMapView();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: kcBgLightColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: kcSecondaryColor.withOpacity(0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 0,
                          child: GestureDetector(
                            onTap: () {
                              viewModel.navigateToMapView();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Assets.svg.search.svg(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              viewModel.navigateToMapView();
                            },
                            child: CustomText(
                                title: translate(AppStrings.searchHint),
                                textColor: kcSecondaryColor),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: GestureDetector(
                            onTap: () {
                              viewModel.navigateToMapView();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Assets.svg.map.svg(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  Banners(
                    dividedBy: 6,
                    items: viewModel.banners
                        .map((e) => e.image ?? AppStrings.placeHolderImages)
                        .toList(),
                  ),
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: DropdownMenu<TypeModel>(
                              initialSelection: viewModel.selectedCategory,
                              hintText: translate(AppStrings.categories),
                              onSelected: (TypeModel? value) {
                                viewModel.updateCategory(value!);
                              },
                              dropdownMenuEntries: viewModel.categories
                                  .map<DropdownMenuEntry<TypeModel>>(
                                      (TypeModel value) {
                                return DropdownMenuEntry<TypeModel>(
                                  value: value,
                                  label: translate(value.name ?? ''),
                                );
                              }).toList(),
                              menuHeight: 200,
                              inputDecorationTheme: InputDecorationTheme(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                constraints: BoxConstraints.tight(
                                    const Size.fromHeight(40)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpaceTiny,
                        Expanded(
                          flex: 0,
                          child: SizedBox(
                            child: DropdownMenu<CountryModel>(
                              initialSelection: viewModel.selectedCountry,
                              hintText: translate(AppStrings.countries),
                              onSelected: (CountryModel? value) {
                                if (value != null) viewModel.updateCountries(value);
                              },
                              dropdownMenuEntries: viewModel.countries
                                  .map<DropdownMenuEntry<CountryModel>>(
                                      (CountryModel value) {
                                return DropdownMenuEntry<CountryModel>(
                                  value: value,
                                  label: value.name ?? '',
                                );
                              }).toList(),
                              menuHeight: 200,
                              // width: screenWidth(context) / 3,
                              inputDecorationTheme: InputDecorationTheme(
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                constraints: BoxConstraints.tight(
                                    const Size.fromHeight(40)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpaceTiny,
                        Expanded(
                          flex: 0,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: kcPrimaryColor,
                              child: IconButton(
                                  onPressed: () {
                                    viewModel.navigateToYachtsView();
                                  },
                                  icon:
                                      Icon(Icons.search, color: kcWhiteColor)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomText(
                          title: translate(AppStrings.topServiceProvider),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        CustomText(
                          title: translate(AppStrings.seeAll),
                          fontSize: 14,
                          textColor: kcSecondaryColor,
                          onTap: viewModel.navigateToProvidersView,
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: viewModel.providers
                        .map((e) => Column(
                              children: [
                                CustomProvider(
                                  onTap: () => viewModel
                                      .navigateToProviderDetailsView(e),
                                  title: e.name,
                                  image: e.image,
                                ),
                                const Divider()
                              ],
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomText(
                          title: translate(AppStrings.topRatedYachts),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        CustomText(
                          title: translate(AppStrings.seeAll),
                          fontSize: 14,
                          textColor: kcSecondaryColor,
                          onTap: () {
                            viewModel.navigateToTopYachtsView();
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: screenHeightFraction(context) / 3.7,
                      width: screenWidth(context),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.yachts.length,
                        itemBuilder: (context, index) {
                          final data = viewModel.yachts[index];
                          return GestureDetector(
                            onTap: () {
                              final _navigationService =
                                  locator<NavigationService>();
                              _navigationService.navigateToDetailsView(
                                  data: data);
                            },
                            child: Container(
                              height:
                                  screenHeightFraction(context, dividedBy: 4),
                              width: screenWidth(context) / 1.5,
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0x19404040)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Column(children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: CustomNetworkImage(
                                              image: data.image?.first ??
                                                  AppStrings
                                                      .placeHolderImages)),
                                    ],
                                  ),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomText(
                                            title: data.name ?? '',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            textColor: kcSecondaryColor,
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                              onTap: () {
                                                viewModel.addFavourite(data);
                                              },
                                              child: Assets.svg.bookmark.svg(
                                                  color: (data.isFav ?? false)
                                                      ? kcPrimaryColor
                                                      : null))
                                        ],
                                      ),
                                      CustomText(
                                        title: data.address ?? '',
                                        fontSize: 12,
                                        textColor: kcSecondaryColor,
                                      ),
                                      CustomText(
                                        title:
                                            '${data.reservations} ${translate(AppStrings.reservations)}',
                                        fontSize: 12,
                                        textColor: kcTextBlackColor,
                                      ),
                                      if (data.isDiscount == 0)
                                        CustomText(
                                          title:
                                              '${data.price} ${AppStrings.defaultCurrency}',
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                          fontWeight: AppFontWeight.bold,
                                          fontSize: AppFontSize.font16,
                                          textColor: kcSecondaryColor,
                                        ),
                                      if (data.isDiscount == 1)
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          alignment: WrapAlignment.center,
                                          children: [
                                            CustomText(
                                              title:
                                                  '${data.discountValue} ${AppStrings.defaultCurrency}',
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              fontWeight: AppFontWeight.bold,
                                              fontSize: AppFontSize.font16,
                                              textColor: kcSecondaryColor,
                                            ),
                                            horizontalSpaceTiny,
                                            CustomText(
                                              title:
                                                  '${(data.price ?? 0)} ${AppStrings.defaultCurrency}',
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              fontSize: AppFontSize.font12,
                                              textColor: kcPrimaryColor,
                                              lineThrough: true,
                                              padding:
                                                  const EdgeInsets.only(top: 1),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                )),
                              ]),
                            ),
                          );
                        },
                      ))
                ],
              ),
            ),
    );

  }



  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.initFCM();
    viewModel.init();

    Future.delayed(Duration.zero, () {
      viewModel.loadLocation();
    });
  }
}

class TypeModel {
  int? id;
  String? name;

  TypeModel({
    this.id,
    this.name,
  });

  factory TypeModel.fromRawJson(String str) =>
      TypeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
