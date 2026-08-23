import 'package:example/ui/index.dart';
import 'package:expandable/expandable.dart';
import 'faq_viewmodel.dart';

class FaqView extends StackedView<FaqViewModel> {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FaqViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: const CustomAppBar(titleText: AppStrings.faq),
        body: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  viewModel.faqs.length,
                  (index) => Container(
                        margin: const EdgeInsets.all(8),
                        child: ExpandablePanel(
                          header: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomText(
                                maxLines: 2,
                                title:
                                    '${index + 1}- ${viewModel.faqs[index].title ?? ''}',
                                fontWeight: AppFontWeight.bold),
                          ),
                          collapsed: Container(),
                          expanded: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              viewModel.faqs[index].body ?? '',
                              softWrap: true,
                            ),
                          ),
                          theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              iconColor: kcSecondaryColor),
                        ),
                      ))),
        ));
  }

  @override
  FaqViewModel viewModelBuilder(BuildContext context) => FaqViewModel();

  @override
  void onViewModelReady(FaqViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getFaqs();
  }
}
