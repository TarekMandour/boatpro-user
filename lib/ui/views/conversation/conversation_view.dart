import 'package:example/ui/index.dart';
import 'conversation_viewmodel.dart';

class ConversationView extends StackedView<ConversationViewModel> {
  final String id;
  final String providerName;
  final String image;
  const ConversationView({
    Key? key,
    required this.id,
    required this.providerName,
    required this.image,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConversationViewModel viewModel,
    Widget? child,
  ) {
    // bool isReciver = false;
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
        backgroundColor: kcSecondaryColor,
        iconTheme: const IconThemeData(color: kcDarkGreyColor),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
                backgroundImage: NetworkImage(image == 'null' || image.isEmpty
                    ? AppStrings.placeHolderImages
                    : image)),
            horizontalSpaceSmall,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: providerName,
                  textColor: kcWhiteColor,
                ),
                CustomText(
                  title: translate(AppStrings.serviceProvider),
                  textColor: kcWhiteColor,
                  fontSize: 12,
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
        leading: Center(
            child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
                color: kcWhiteColor, borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.arrow_back),
          ),
        )),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 65),
                  child: Column(
                    children: List.generate(
                      viewModel.data.length,
                      (index) => Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Align(
                          alignment: Helper.isArabic()
                              ? (viewModel.data[index].senderId ==
                                      viewModel.prefService.userData?.id
                                  ? Alignment.topLeft
                                  : Alignment.topRight)
                              : (viewModel.data[index].senderId ==
                                      viewModel.prefService.userData?.id
                                  ? Alignment.topRight
                                  : Alignment.topLeft),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: viewModel.data[index].senderId ==
                                      viewModel.prefService.userData?.id
                                  ? kcDarkGreyColor
                                  : (kcSecondaryColor),
                              boxShadow: [
                                BoxShadow(
                                  color: kcMediumGrey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12),
                            child: CustomMediaWidget(
                              content: viewModel.data[index].message ?? '',
                              isReciver: false,
                              type: 'image',
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: CustomFieldInput(
                          hintText: translate(AppStrings.typeYourMessage),
                          onSubmitDone: (value) {
                            viewModel.sendMessage(value, int.parse(id));
                          },
                          controller: viewModel.controller,

                          colorBg: Color(0x19404040),
                          // controller: viewModel.controller,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // viewModel.getMediaPicker();
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Assets.svg.attach.svg(),
                    //   ),
                    // ),
                    horizontalSpaceTiny,
                    GestureDetector(
                        onTap: () {
                          viewModel.sendMessage(
                              viewModel.controller.text, int.parse(id));
                        },
                        child: Assets.svg.send.svg()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConversationViewModel viewModelBuilder(BuildContext context) =>
      ConversationViewModel();

  @override
  void onViewModelReady(ConversationViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getThreadChat(id);
  }

  @override
  bool get disposeViewModel => false;
}

class CustomMediaWidget extends StatelessWidget {
  final String content;
  final String type;
  final bool isReciver;
  final GestureTapCallback? onTap;
  const CustomMediaWidget(
      {super.key,
      required this.content,
      required this.type,
      required this.isReciver,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    // if (type == 'text') {
    return Text(
      content,
      style: TextStyle(fontSize: 15, color: kcWhiteColor),
    );
    // } else {
    // if (Helper().getFileType(content) == 'Image') {
    //   return SizedBox(
    //     height: 100,
    //     width: screenWidthFraction(context, dividedBy: 3),
    //     child: GestureDetector(
    //       onTap: onTap,
    //       child: CustomNetworkImage(
    //         image: content,
    //         borderRadius: 10,
    //       ),
    //     ),
    //   );
    // } else if (Helper().getFileType(content) == 'Video') {
    //   return SizedBox(
    //     height: 100,
    //     width: screenWidthFraction(context, dividedBy: 2),
    //     child: GestureDetector(
    //       onTap: onTap,
    //       child: VideoThumbnailWidget(videoPath: content, isReciver: isReciver),
    //     ),
    //   );
    // } else {
    //   return SizedBox(
    //     width: screenWidthFraction(context, dividedBy: 4),
    //     child: GestureDetector(
    //       onTap: onTap,
    //       child: Column(
    //         children: [
    //           Icon(Iconsax.document_text, color: (isReciver ? kcMediumGrey : kcWhiteColor)),
    //           verticalSpaceSmall,
    //           Text(
    //             "${translate(AppStrings.previewFile)}",
    //             style:
    //                 TextStyle(fontSize: 13, fontWeight: AppFontWeight.bold, color: (isReciver ? kcMediumGrey : kcWhiteColor)),
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }
    // }
  }
}
