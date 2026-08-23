import 'package:dots_indicator/dots_indicator.dart';
import 'package:example/ui/index.dart';
import 'intro_viewmodel.dart';

class IntroView extends StackedView<IntroViewModel> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IntroViewModel viewModel,
    Widget? child,
  ) {
    viewModel.changeContent(viewModel.currentIndex);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: viewModel.currentIndex == 0
                    ? Assets.images.intro1.provider()
                    : viewModel.currentIndex == 1
                        ? Assets.images.intro2.provider()
                        : Assets.images.intro3.provider(),
                fit: BoxFit.cover)),
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: viewModel.controller,
            onPageChanged: (value) => viewModel.changeIndex(value),
            itemCount: viewModel.pages,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(18),
                    margin: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kcWhiteColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            viewModel.title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: kcWhiteColor,
                                fontSize: AppFontSize.font25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (viewModel.currentIndex == 0)
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              'BoatPro',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: kcPrimaryColor,
                                  fontSize: AppFontSize.font32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        SizedBox(
                          width: screenWidthFraction(context) / 1.1,
                          child: Text(
                            viewModel.description,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: kcWhiteColor,
                                fontSize: AppFontSize.font16),
                          ),
                        ),
                        verticalSpaceSmall,
                        if (viewModel.currentIndex != 2)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => viewModel.skipButton(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    translate(AppStrings.skip),
                                    style: const TextStyle(
                                        color: kcWhiteColor,
                                        fontSize: AppFontSize.font14),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 0,
                                child: DotsIndicator(
                                  dotsCount: viewModel.pages,
                                  position: viewModel.currentIndex.toDouble(),
                                  decorator: DotsDecorator(
                                    colors: [
                                      kcIndicatorColor,
                                      kcIndicatorColor,
                                      kcIndicatorColor
                                    ],
                                    size: const Size(8.0, 8.0),
                                    activeSize: const Size(40.0, 5.0),
                                    spacing: EdgeInsets.all(4),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                  ),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: kcWhiteColor,
                                      border:
                                          Border.all(color: kcPrimaryColor)),
                                  width: 48,
                                  height: 48,
                                  child: IconButton(
                                      onPressed: () => viewModel.nextPage(),
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                        color: kcPrimaryColor,
                                      )))
                            ],
                          ),
                        if (viewModel.currentIndex == 2)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    text: translate(AppStrings.login),
                                    borderRadius: 16,
                                    isSecondary: true,
                                    colorButton: kcWhiteColor,
                                    onTap: () {
                                      viewModel.loginBtn();
                                    },
                                  )),
                              horizontalSpaceSmall,
                              Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                    text: translate(AppStrings.register),
                                    borderRadius: 16,
                                    colorButton: kcPrimaryColor,
                                    onTap: () {
                                      viewModel.registerBtn();
                                    },
                                  )),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  @override
  IntroViewModel viewModelBuilder(BuildContext context) => IntroViewModel();

  @override
  void onViewModelReady(IntroViewModel viewModel) {
    viewModel.controller = PageController(initialPage: 0);
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(IntroViewModel viewModel) {
    viewModel.controller.dispose();
    super.onDispose(viewModel);
  }
}
