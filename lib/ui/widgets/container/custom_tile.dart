import '../../index.dart';

class CustomTile extends StatelessWidget {
  final Widget? leadChild;
  final Widget? titleChild;
  final Widget? trailingChild;
  final bool showDivider;
  final GestureTapCallback? onTap;
  final Color colorBg;
  final Color colorBorder;

  const CustomTile({
    super.key,
    this.leadChild,
    this.titleChild,
    this.trailingChild,
    this.showDivider = true,
    this.onTap,
    this.colorBg = kcWhiteColor,
    this.colorBorder = kcBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorBorder.withOpacity(0.3)),
          color: colorBg,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(flex: 0, child: leadChild ?? Container()),
            if (leadChild != null) horizontalSpaceSmall,
            Expanded(flex: 1, child: titleChild ?? Container()),
            Expanded(flex: 0, child: trailingChild ?? Container()),
          ],
        ),
      ),
    );
  }
}
