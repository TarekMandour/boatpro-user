import 'package:example/ui/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'pay_viewmodel.dart';

class PayView extends StackedView<PayViewModel> {
  final String url;

  const PayView({Key? key, required this.url}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: const CustomAppBar(titleText: AppStrings.pay),
      body: Stack(
        children: [
          WebViewWidget(controller: viewModel.controller),
          if (viewModel.isBusy)
            Container(
                width: double.infinity,
                height: double.infinity,
                color: kcWhiteColor,
                child: const Center(child: CustomLoadWidget()))
        ],
      ),
    );
  }

  @override
  PayViewModel viewModelBuilder(BuildContext context) => PayViewModel();
  @override
  void onViewModelReady(PayViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init(url);
  }
}
