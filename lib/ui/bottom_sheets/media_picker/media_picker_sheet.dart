import 'package:example/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/common/app_colors.dart';
import 'package:example/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'media_picker_sheet_model.dart';

class MediaPickerSheet extends StackedView<MediaPickerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const MediaPickerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MediaPickerSheetModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Center(
              child: Text(
                request.title ?? '',
                style: const TextStyle(
                    fontSize: AppFontSize.font18,
                    fontWeight: FontWeight.w900,
                    color: kcDarkGreyColor),
              ),
            ),
            verticalSpaceMedium,
            Center(
              child: CustomButton(
                text: request.mainButtonTitle ?? '',
                icon: Icon(Icons.folder, color: kcWhiteColor),
                visibleIcon: true,
                borderRadius: 100,
                onTap: () {
                  viewModel.pickDocument(
                    callBack: () {
                      completer!(SheetResponse(
                        data: {
                          'type': 'file',
                          'file': viewModel.document,
                        },
                      ));
                    },
                  );
                },
              ),
            ),
            verticalSpaceSmall,
            Center(
              child: CustomButton(
                text: request.secondaryButtonTitle ?? '',
                borderRadius: 100,
                icon: Icon(Icons.image, color: kcWhiteColor),
                visibleIcon: true,
                onTap: () {
                  viewModel.pickImage(
                    callBack: () {
                      completer!(SheetResponse(
                        data: {
                          'type': 'image',
                          'file': viewModel.image,
                        },
                      ));
                    },
                  );
                },
              ),
            ),
            verticalSpaceSmall,
            Center(
              child: CustomButton(
                text: request.additionalButtonTitle ?? '',
                borderRadius: 100,
                icon:
                    Icon(Icons.video_camera_back_rounded, color: kcWhiteColor),
                visibleIcon: true,
                onTap: () {
                  viewModel.pickVideo(
                    callBack: () {
                      completer!(SheetResponse(
                        data: {
                          'type': 'video',
                          'file': viewModel.video,
                        },
                      ));
                    },
                  );
                },
              ),
            )
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
      ),
    );
  }

  @override
  MediaPickerSheetModel viewModelBuilder(BuildContext context) =>
      MediaPickerSheetModel();
}
