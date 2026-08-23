import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:example/ui/index.dart';
import 'book_yacht_viewmodel.dart';

class BookYachtView extends StackedView<BookYachtViewModel> {
  final String yachtId;
  final bool isUpdate;

  const BookYachtView({Key? key, required this.yachtId, this.isUpdate = false})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BookYachtViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBgDarkColor,
      appBar: const CustomAppBar(titleText: AppStrings.bookYacht),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              // CustomItem(isFav: false),
              CustomText(
                title: translate(AppStrings.pickYourDate),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontSize: AppFontSize.font14,
                textColor: kcTextBlackColor,
              ),
              verticalSpaceSmall,
              SizedBox(
                height: 40,
                child: GridView.builder(
                  itemCount: viewModel.dates.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.selectedTime = null;
                        viewModel.selectedDate = viewModel.dates[index];
                        viewModel.notifyListeners();
                        viewModel.getYachtTimes(yachtId,
                            viewModel.selectedDate?.date.toString() ?? '');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                viewModel.dates[index] == viewModel.selectedDate
                                    ? kcGreenColor
                                    : kcBorderColor.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: CustomText(
                          title: Helper.getFormattedDate(
                              viewModel.dates[index].date.toString()),
                          fontSize: AppFontSize.font12,
                          fontWeight: AppFontWeight.bold,
                          textColor:
                              viewModel.dates[index] == viewModel.selectedDate
                                  ? kcWhiteColor
                                  : kcTextColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (viewModel.selectedDate != null) ...[
                verticalSpaceSmall,
                CustomText(
                  title: translate(AppStrings.pickYourTime),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: AppFontSize.font14,
                  textColor: kcTextBlackColor,
                ),
                verticalSpaceSmall,
                SizedBox(
                  height: 40,
                  child: GridView.builder(
                    itemCount: viewModel.times.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 0.28,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (viewModel.selectedTime == viewModel.times[index]) {
                            viewModel.selectedTime = null;
                          } else {
                            viewModel.selectedTime = viewModel.times[index];
                          }
                          viewModel.notifyListeners();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: viewModel.selectedTime == viewModel.times[index]
                                  ? kcGreenColor
                                  : kcBorderColor.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: CustomText(
                            title: Helper.formatTime(viewModel
                                    .times[index].startTime
                                    .toString()) +
                                ' - ' +
                                Helper.formatTime(
                                    viewModel.times[index].endTime.toString()),
                            fontSize: AppFontSize.font12,
                            fontWeight: AppFontWeight.bold,
                            textColor: viewModel.selectedTime == viewModel.times[index]
                                ? kcWhiteColor
                                : kcTextColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              verticalSpaceSmall,
              // Description
              CustomText(
                title: translate(AppStrings.peopleNumber),
                fontSize: AppFontSize.font14,
                padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
              ),
              CustomFieldInput(
                hintText: translate(AppStrings.peopleNumber),
                onChange: (value) => viewModel.updatePeopleNumber(value),
                isErrorValid: viewModel.validatePeopleNumber,
                keyboardType: TextInputType.phone,
              ),
              verticalSpaceSmall,
              // Description
              CustomText(
                title: translate(AppStrings.writeDescription),
                fontSize: AppFontSize.font14,
                padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
              ),
              CustomFieldInput(
                hintText: translate(AppStrings.confirmReservation),
                maxLines: 5,
                onChange: (value) => viewModel.updateDescription(value),
                isErrorValid: viewModel.validateDescription,
              ),
              if (viewModel.errorMessageDescription.isNotEmpty)
                Column(
                  children: [
                    verticalSpaceTiny,
                    Text(viewModel.errorMessageDescription,
                        style: const TextStyle(
                            fontSize: AppFontSize.font12, color: kcRedColor)),
                  ],
                ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: translate(AppStrings.confirmReservation),
                      onTap: () => viewModel.bookYacht(yachtId, isUpdate),
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  @override
  BookYachtViewModel viewModelBuilder(BuildContext context) =>
      BookYachtViewModel();

  @override
  void onViewModelReady(BookYachtViewModel viewModel) {
    viewModel.getYachtDates(yachtId);
    super.onViewModelReady(viewModel);
  }
}
