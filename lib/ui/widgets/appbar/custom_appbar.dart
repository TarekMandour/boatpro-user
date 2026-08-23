import 'package:example/ui/index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? titleText;
  final bool backButton;
  final PreferredSizeWidget? bottom;

  @override
  final Size preferredSize;

  const CustomAppBar({
    Key? key,
    this.actions,
    this.titleText,
    this.backButton = true,
    this.bottom,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kcSecondaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kcDarkGreyColor),
        actions: actions,
        elevation: 0,
        title: Text(translate(titleText ?? ''),
            style: const TextStyle(
                color: kcWhiteColor,
                fontSize: AppFontSize.font16,
                fontWeight: AppFontWeight.extraBold)),
        bottom: bottom,
        centerTitle: true,
        leading: backButton
            ? Center(
                child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_back),
                ),
              ))
            : Container(),
      ),
    );
  }
}
