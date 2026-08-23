import '../../index.dart';

class CustomShape extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget icon;
  final String? title;
  final Color color;
  final FontWeight fontWeight;
  const CustomShape({
    super.key,
    this.onTap,
    this.icon = const Icon(Icons.check_circle),
    this.title,
    this.color = kcPrimaryColor,
    this.fontWeight = AppFontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          if (title != null)
            Text(
              title ?? '',
              style: TextStyle(color: color, fontWeight: fontWeight),
            )
        ],
      ),
    );
  }
}
