import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/loading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar:
          // PreferredSize(
          //   preferredSize: Size.fromHeight(screenHeightFraction(context) / 6.5),
          //   child:
          AppBar(
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
        //             color: kcBgLightColor,
        //             borderRadius: BorderRadius.circular(16),
        //             border:
        //                 Border.all(color: kcSecondaryColor.withOpacity(0.5))),
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
        //               child: GestureDetector(
        //                 onTap: () {},
        //                 child: CustomText(
        //                     title: translate(AppStrings.searchHint),
        //                     textColor: kcSecondaryColor),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     )),
      ),
      // ),
      body: viewModel.isBusy
          ? CustomLoading()
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  markers: viewModel.markers,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        viewModel.position?.latitude ?? 0.0,
                        viewModel.position?.longitude ?? 0.0,
                      ),
                      zoom: 16),
                  onMapCreated: viewModel.onMapCreated,
                ),
              ],
            ),
    );
  }

  @override
  MapViewModel viewModelBuilder(BuildContext context) => MapViewModel();

  @override
  void onViewModelReady(MapViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.initMap();
  }
}
