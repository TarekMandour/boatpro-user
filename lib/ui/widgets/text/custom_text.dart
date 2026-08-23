import 'package:example/ui/index.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;
  final bool underline;
  final bool lineThrough;
  final bool italic;
  final TextDirection? textDirection;
  final GestureTapCallback? onTap;

  const CustomText(
      {super.key,
      required this.title,
      this.fontSize = AppFontSize.font14,
      this.textOverflow = TextOverflow.ellipsis,
      this.maxLines = 1,
      this.fontWeight = FontWeight.normal,
      this.textColor,
      this.fontFamily,
      this.padding,
      this.textAlign,
      this.underline = false,
      this.lineThrough = false,
      this.italic = false,
      this.textDirection,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: underline
                ? Border(
                    bottom: BorderSide(
                        width: 0.5, color: textColor ?? kcBorderColor),
                  )
                : null),
        padding: padding ?? const EdgeInsets.all(0),
        child: Text(
          title,
          textAlign: textAlign ?? TextAlign.start,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            color: textColor ?? kcTextColor,
            decoration:
                lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
          ),
          textDirection: textDirection,
          overflow: textOverflow,
        ),
      ),
    );
  }
}
