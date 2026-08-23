import 'package:example/ui/index.dart';

import 'chats_viewmodel.dart';

class ChatsView extends StackedView<ChatsViewModel> {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar:
          const CustomAppBar(titleText: AppStrings.chats, backButton: false),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                viewModel.data.length,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: CustomTile(
                    leadChild: CircleAvatar(
                        backgroundColor: kcSecondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  viewModel.data[index].image?.isEmpty ?? false
                                      ? AppStrings.placeHolderImages
                                      : viewModel.data[index].image ??
                                          AppStrings.placeHolderImages),
                              backgroundColor: kcPrimaryColor),
                        )),
                    titleChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          title: viewModel.data[index].name ?? '',
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: translate(AppStrings.serviceProvider),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          textColor: kcTextColor,
                        ),
                      ],
                    ),
                    onTap: () => Helper().navigateToConversationView(
                      viewModel.data[index].id.toString(),
                      viewModel.data[index].name.toString(),
                      viewModel.data[index].image.toString(),
                    ),
                    trailingChild: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kcSecondaryColor),
                        child: Center(
                            child: Assets.svg.chat.svg(color: kcWhiteColor))),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  @override
  ChatsViewModel viewModelBuilder(BuildContext context) => ChatsViewModel();

  @override
  void onViewModelReady(ChatsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getChats();
  }
}
