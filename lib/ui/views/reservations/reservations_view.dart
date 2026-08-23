import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/container/custom_reserve.dart';
import 'reservations_viewmodel.dart';

class ReservationsView extends StackedView<ReservationsViewModel> {
  const ReservationsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReservationsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: const CustomAppBar(
          titleText: AppStrings.reservations,
          backButton: false,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 0,
              child: TabBar(
                labelColor: kcMediumGrey,
                labelPadding: const EdgeInsets.all(0),
                indicatorColor: kcPrimaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: translate(AppStrings.all)),
                  Tab(text: translate(AppStrings.completed)),
                  Tab(text: translate(AppStrings.inprogress)),
                ],
              ),
            ),
            verticalSpaceSmall,
            Expanded(
              child: TabBarView(
                children: [
                  viewModel.list.isEmpty
                      ? Center(child: Text(translate(AppStrings.emptyResult)))
                      : SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                                  viewModel.list.length,
                                  (index) => CustomReserve(
                                        image:
                                            viewModel.list[index].yachtImage ??
                                                '',
                                        status: viewModel.list[index]
                                                .reservationsStatus ??
                                            '',
                                        title:
                                            viewModel.list[index].yachtName ??
                                                '',
                                        total: viewModel.list[index].total
                                            .toString(),
                                        yachtId:
                                            viewModel.list[index].id.toString(),
                                        onTap: () => viewModel
                                            .navigateToReservationDetailsView(
                                                viewModel.list[index].id
                                                    .toString(),
                                                false),
                                      )))),
                  viewModel.completedList.isEmpty
                      ? Center(child: Text(translate(AppStrings.emptyResult)))
                      : SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                                  viewModel.completedList.length,
                                  (index) => CustomReserve(
                                        image: viewModel.completedList[index]
                                                .yachtImage ??
                                            '',
                                        status: viewModel.completedList[index]
                                                .reservationsStatus ??
                                            '',
                                        title: viewModel.completedList[index]
                                                .yachtName ??
                                            '',
                                        total: viewModel
                                            .completedList[index].total
                                            .toString(),
                                        yachtId: viewModel
                                            .completedList[index].id
                                            .toString(),
                                        onTap: () => viewModel
                                            .navigateToReservationDetailsView(
                                                viewModel
                                                    .completedList[index].id
                                                    .toString(),
                                                false),
                                      )))),
                  viewModel.inProgressList.isEmpty
                      ? Center(child: Text(translate(AppStrings.emptyResult)))
                      : SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                                  viewModel.inProgressList.length,
                                  (index) => CustomReserve(
                                        image: viewModel.inProgressList[index]
                                                .yachtImage ??
                                            '',
                                        status: viewModel.inProgressList[index]
                                                .reservationsStatus ??
                                            '',
                                        title: viewModel.inProgressList[index]
                                                .yachtName ??
                                            '',
                                        total: viewModel
                                            .inProgressList[index].total
                                            .toString(),
                                        yachtId: viewModel
                                            .inProgressList[index].id
                                            .toString(),
                                        onTap: () => viewModel
                                            .navigateToReservationDetailsView(
                                                viewModel
                                                    .inProgressList[index].id
                                                    .toString(),
                                                false),
                                      )))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ReservationsViewModel viewModelBuilder(BuildContext context) =>
      ReservationsViewModel();

  @override
  void onViewModelReady(ReservationsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getReservations();
  }
}
