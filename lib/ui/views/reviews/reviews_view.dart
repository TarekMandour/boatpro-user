import 'package:example/ui/index.dart';
import 'package:example/ui/widgets/container/custom_review.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import 'reviews_viewmodel.dart';

class ReviewsView extends StackedView<ReviewsViewModel> {
  const ReviewsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReviewsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: const CustomAppBar(titleText: AppStrings.myReviews),
      body: viewModel.rates.isEmpty && viewModel.isBusy == false
          ? Center(child: CustomText(title: translate(AppStrings.emptyResult)))
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: List.generate(
                    viewModel.rates.length,
                    (index) => CustomReview(
                      data: viewModel.rates[index],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  ReviewsViewModel viewModelBuilder(BuildContext context) => ReviewsViewModel();

  @override
  void onViewModelReady(ReviewsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getRate();
  }
}
