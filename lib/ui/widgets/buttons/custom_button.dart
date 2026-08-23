import '../../index.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSecondary;
  final Widget? icon;
  final bool visibleIcon;
  final Color colorButton;
  final Color colorText;
  final double borderRadius;
  final double fontSizeText;
  final GestureTapCallback? onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.isSecondary = false,
      this.visibleIcon = false,
      this.icon,
      this.colorButton = kcSecondaryColor,
      this.colorText = Colors.white,
      this.borderRadius = 16.0,
      this.fontSizeText = AppFontSize.font14,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth(context) / 2,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border:
                isSecondary ? Border.all(color: colorButton, width: 1.5) : null,
            color: isSecondary ? null : colorButton),
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: visibleIcon,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
            ),
            Text(text,
                style: TextStyle(
                    color: colorText,
                    fontSize: fontSizeText,
                    fontWeight: AppFontWeight.bold)),
          ],
        )),
      ),
    );
  }
}
