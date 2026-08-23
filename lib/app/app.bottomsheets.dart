// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/language/language_sheet.dart';
import '../ui/bottom_sheets/media_picker/media_picker_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  mediaPicker,
  language,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.mediaPicker: (context, request, completer) =>
        MediaPickerSheet(request: request, completer: completer),
    BottomSheetType.language: (context, request, completer) =>
        LanguageSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
