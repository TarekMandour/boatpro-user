import 'package:example/ui/index.dart';
import 'notifications_viewmodel.dart';

class NotificationsView extends StackedView<NotificationsViewModel> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: const CustomAppBar(titleText: AppStrings.notifications),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: List.generate(
              viewModel.data.length,
              (index) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kcBorderColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  // leading: Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       color: kcPrimaryColor,
                  //       image: DecorationImage(image: Assets.images.intro1.provider(), fit: BoxFit.cover)),
                  //   width: 40,
                  //   height: 40,
                  // ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: viewModel.data[index].title ?? '',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.font14,
                      ),
                      CustomText(
                        title: viewModel.data[index].body ?? '',
                        maxLines: 10,
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppFontSize.font12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            title: Helper.getFormattedDate(
                                viewModel.data[index].date.toString()),
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: AppFontSize.font12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  NotificationsViewModel viewModelBuilder(BuildContext context) =>
      NotificationsViewModel();

  @override
  void onViewModelReady(NotificationsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getNotification();
  }
}
