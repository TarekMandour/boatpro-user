import 'package:example/ui/index.dart';
import 'pages_viewmodel.dart';

class PagesView extends StackedView<PagesViewModel> {
  final String title;
  final String body;

  const PagesView({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PagesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: CustomAppBar(titleText: title),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: CustomText(
            title: body,
            maxLines: 1000,
          ),
        ),
      ),
    );
  }

  @override
  PagesViewModel viewModelBuilder(BuildContext context) => PagesViewModel();
}
