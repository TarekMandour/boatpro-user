import 'package:example/ui/index.dart';
import 'error_snackbar_model.dart';

class ErrorSnackBar extends StackedView<ErrorSnackBarModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const ErrorSnackBar({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ErrorSnackBarModel viewModel,
    Widget? child,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              Center(
                child: Text(
                  request.title ?? '',
                  style: const TextStyle(
                      fontSize: AppFontSize.font18,
                      fontWeight: FontWeight.w900,
                      color: kcPrimaryColor),
                ),
              ),
              verticalSpaceTiny,
              Text(
                request.description ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: AppFontSize.font14, color: kcDarkGreyColor),
                maxLines: 3,
                softWrap: true,
              ),
              verticalSpaceSmall,
              verticalSpaceTiny,
              if ((request.mainButtonTitle?.isNotEmpty ?? false) &&
                  (request.secondaryButtonTitle?.isEmpty ?? true))
                Center(
                  child: CustomButton(
                    text: request.mainButtonTitle ?? '',
                    onTap: () {
                      completer!(SheetResponse(confirmed: true));
                    },
                  ),
                )
              else
                Row(
                  children: [
                    if (request.mainButtonTitle?.isNotEmpty ?? false)
                      Expanded(
                          child: CustomButton(
                              text: request.secondaryButtonTitle ?? '',
                              isSecondary: true,
                              onTap: () =>
                                  completer!(SheetResponse(confirmed: false)))),
                    horizontalSpaceTiny,
                    if (request.secondaryButtonTitle?.isNotEmpty ?? false)
                      Expanded(
                          child: CustomButton(
                        text: request.mainButtonTitle ?? '',
                        onTap: () => completer!(SheetResponse(confirmed: true)),
                      ))
                  ],
                )
            ],
          ),
          decoration: const BoxDecoration(
            color: kcWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: kcWhiteColor,
            radius: 21,
            child: CircleAvatar(
              child: request.data,
              backgroundColor: kcPrimaryColor,
              foregroundColor: kcWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  ErrorSnackBarModel viewModelBuilder(BuildContext context) =>
      ErrorSnackBarModel();
}
